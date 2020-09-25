import React from 'react';
import { useState } from 'react';
import { postRecipe, postRecipeTypes, postRecipeMelas, postRecipeIngredients } from '../../services';
import Search from '../Search/Search';
import './NewRecipeForm.css'; 
import {useHistory}  from 'react-router-dom';

const CHECKBOX_TYPES = {
    types: "types",
    meals: "meals"
}

const NewRecipeForm = ({ingredients, types, meals}) => {

    const [name, setName] = useState('');
    const [description, setDescription] = useState('');
    const [time, setTime] = useState('');
    const [amount, setAmount] = useState('');
    const [instructions, setInstructions] = useState('');
    const [selectedChecboxes, setSelectedChecboxes] = useState({types: [], meals:[]});
    const [selectedIngredients, setSelectedIngredients]= useState([{id: 1}]);
    const history = useHistory();
    

    const [nameError, setNameError] = useState('');

    const handleCheckboxchange = (e, type) => {
        let tmp = {...selectedChecboxes};
        if(e.target.checked){
            tmp[type].push(e.target.value);
        }else{
            tmp[type].splice(tmp[type].indexOf(e.target.value), 1);
        }
        setSelectedChecboxes(tmp)
        console.log(tmp);
    }

    const renderCheckboxes = (array, name) => {
        return(
            array.map(el => <label key={el.id} className='checkbox-label'><input type='checkbox' value={el.id} name={name} onChange={(e) => handleCheckboxchange(e, name)}/> {el.naziv}</label>)
        )
    }

    const isValid = () => {
        if(name === ''){
            setNameError('Naziv recepta je obavezno polje');
            return false;
        }else{
            return true;
        }
    }

    const addNewRecipe = (e) => {

        e.preventDefault();

        let d = new Date();
        let datetime =  d.getFullYear() + '-'
                        + (d.getMonth()+1) + '-'
                        + d.getDate() + ' '
                        + d.getHours() + ':'  
                        + d.getMinutes() + ':' 
                        + d.getSeconds();

        if(isValid()){

            let recipe = {
                naziv: name,
                autor: JSON.parse(localStorage.getItem('user'))[0].id,
                duzina_pripreme: time,
                opis: description,
                uputstvo: instructions,
                vreme: datetime
            };

            postRecipe(recipe).then(res => {
                let id = res.data.insertId;
                selectedChecboxes.types.map(type => postRecipeTypes(type, id));
                selectedChecboxes.meals.map(meal => postRecipeMelas(meal, id));
                selectedIngredients.slice(1).map(ingredient => postRecipeIngredients(ingredient.ingredient, id, ingredient.amount));
                history.push(`addRecipe/image/${id}`);
            });
        }
    }

    return (
        <div className='wrapper'>
            <div className='container-fluid new-recipe-wrapper'>
                <div className='row new-recipe-row'>
                    <div className='col-sm-8 offset-sm-2 mt-4'>
                    <form onSubmit={addNewRecipe} className='form-recipe'>
                        <h2>Novi recept</h2>
                        <input type='text' placeholder='Naziv recepta' onChange={(e) => setName(e.target.value)} className='form-control'/>
                        <p>{nameError}</p>
                        <textarea placeholder='Opis' onChange={(e) => setDescription(e.target.value)} className='form-control'></textarea>
                        <h2>Sastojci</h2>
                        {selectedIngredients.map(selected => {
                            return(
                                <Search key={selected.id} ingredients={ingredients} amount={amount} setAmount={setAmount} selectedIngredients={selectedIngredients} setSelectedIngredients={setSelectedIngredients}/>
                            )
                        })}
                        <textarea placeholder='Uputstvo' onChange={(e) => setInstructions(e.target.value)} className='form-control instructions-textarea' ></textarea>
                        <br/>
                        <input type='text' placeholder='Dužina pripreme' onChange={(e) => setTime(e.target.value)} className='form-control'
                        />
                        <br/>
                        <p><b>Obrok:</b></p>
                            {renderCheckboxes(meals, CHECKBOX_TYPES.meals)}
                        <br/>
                        <p><b>Tip recepta:</b></p>
                            {renderCheckboxes(types, CHECKBOX_TYPES.types)}
                            <br/><br/>
                        <button type='submit' className='btn btn-primary btn-lg btn-block'>Dodaj</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    )
}

export default NewRecipeForm;