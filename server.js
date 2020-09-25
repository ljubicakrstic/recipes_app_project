const express = require('express');
const mysql = require('mysql');
const fileUpload = require('express-fileupload');
const cors = require("cors");
const bodyParser = require('body-parser');

const db = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'recepti'
  });

  db.connect((err) => {
    if(err){
        throw err;
    }else{
        console.log('mysql conected');
    }
  });

const app = express();
app.use(fileUpload());
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));


app.get('/types', (req, res) => {
    let sql = 'SELECT * FROM tip_jela';
    db.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result);
        console.log(result);
    });
});

app.get('/ingredients', (req, res) => {
    let sql = 'SELECT * FROM sastojci';
    db.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result);
        console.log(result);
    });
});


app.get('/recipe', (req, res) => {
    let id = req.query.id;
    let sql = `SELECT recept.id, naziv, duzina_pripreme, opis, uputstvo, vreme, korisnicko_ime, slika
                FROM recept JOIN korisnici ON recept.autor = korisnici.id
                LEFT JOIN slika ON recept.id = slika.id_recept
                WHERE recept.id = ${id}`;
    db.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
});

app.get('/recipeIngredients', (req, res) => {
    let id = req.query.id;
    let sql = `SELECT kolicina, sastojci.naziv
                FROM recept_sastojci 
                JOIN sastojci ON recept_sastojci.id_sastojak = sastojci.id
                WHERE recept_sastojci.id_recept = ${id}`;
    db.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
});

app.get('/recipeTypes', (req, res) => {
    let id = req.query.id;
    let sql = `SELECT naziv FROM tip_jela 
                JOIN recept_tip ON tip_jela.id = recept_tip.id_tip
                WHERE id_recept = ${id}`;
    db.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
});

app.get('/recipeMeals', (req, res) => {
    let id = req.query.id;
    let sql = `SELECT naziv FROM grupa_jela 
                JOIN recept_grupa ON grupa_jela.id = recept_grupa.id_grupa
                WHERE id_recept = ${id}`;
    db.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
});


app.get('/meals', (req, res) => {
    let sql = 'SELECT * FROM grupa_jela';
    db.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
});

app.post('/recipes', (req, res) => {
    // console.log(req.body);
    let sql = 'INSERT INTO recept SET ?';
    let query = db.query(sql, req.body, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
});

app.post('/login', (req, res) => {
    console.log(req.body);
    let username = req.body.username;
    let password = req.body.password;
    let sql = `SELECT * FROM korisnici WHERE korisnicko_ime = '${username}' AND sifra = '${password}'`;
    db.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
});

app.get('/user', (req, res) => {
    let id = req.query.id;
    let sql = `SELECT * FROM recepti.korisnici WHERE id = ${id}`;
    db.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
});

app.get('/recipesByMeal', (req, res) => {
    let meal = req.query.meal;
    let sql = `SELECT recept.*, slika FROM recepti.recept
                JOIN slika on recept.id = slika.id_recept
                JOIN recept_grupa
                WHERE id_grupa = ${meal}
                and recept.id = recept_grupa.id_recept`;
                
    db.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result);
     });
});


app.get('/recipesByType', (req, res) => {
    let type = req.query.type;
    let sql = `SELECT recept.*, slika FROM recepti.recept
                JOIN slika on recept.id = slika.id_recept
                JOIN recept_tip
                WHERE id_tip = ${type}
                and recept.id = recept_tip.id_recept`;
                
    db.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result);
     });
});



app.get('/recipes', (req, res) => {
    let sql = `SELECT recept.*, slika FROM recepti.recept 
               JOIN slika on recept.id = slika.id_recept`;
    db.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result);
    });          
});

app.post('/types', (req, res) => {
    let sql = 'INSERT INTO recept_tip SET ?';
    let query = db.query(sql, req.body, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
});

app.post ('/registerUser', (req, res) => {
    let sql = 'INSERT INTO korisnici SET ?';
    let query = db.query(sql, req.body, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
});

app.post('/meals', (req, res) => {
    let sql = 'INSERT INTO recept_grupa SET ?';
    let query = db.query(sql, req.body, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
});

app.post('/ingredients', (req, res) => {
    let sql = 'INSERT INTO recept_sastojci SET ?';
    let query = db.query(sql, req.body, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
});


app.post('/upload', (req, res) => {

    const imageID = req.body.imageId;

    if(req.files === null){
        return res.status(400).json({ msg: 'No file uploaded'});
    }

    const file = req.files.file;
    file.mv(`${__dirname}/client/public/uploads/${imageID}_${file.name}`, err => {
        if(err){
            console.error(err);
            return res.status(500).send(err);
        }
        res.json({ fileName: file.name, filePath: `/uploads/${imageID}_${file.name}`});
    });
});

app.post('/addImage', (req, res) => {
    let sql = 'INSERT INTO slika SET ?';
    let query = db.query(sql, req.body, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
});

app.listen('5000', () => {
    console.log('Server started on port 5000');
});