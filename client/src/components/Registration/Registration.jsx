import React, { useState } from 'react';
import { findUser, findUserById, registerUser } from '../../services';
import './Registration.css';
import { useHistory } from 'react-router-dom';

const Registration = ({setUser}) => {

    const [username, setUsername] = useState('');
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');

    const [usernameError, setUsernameError] = useState('');
    const [nameError, setNameError] = useState('');
    const [emailError, setEmailError] = useState('');
    const [passwordError, setPasswordError]= useState('');
    const [confirmError, setConfirmError] = useState(''); 

    const history = useHistory();


    const validateEmail = (email) => {
        const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    }

    const isValid = () => {
        if(username.trim() === ''){
            setUsernameError('Morate uneti korisničko ime');
        }else{
            setUsernameError('');
        }
        if(name.trim() === ''){
            setNameError('Morate uneti ime i prezime');
        }else{
            setNameError('');
        }
        if(validateEmail(email) === false){
            setEmailError('Neispravan format emaila');
        }else{
            setEmailError('');
        }
        if(password.length < 7){
            setPasswordError('Lozinka ne sme biti kraća od 7 karaktera');
        }else{
            setPasswordError('');
        }
        if(password !== confirmPassword){
            setConfirmError('Lozinke se ne poklapaju');
        }else{
            setConfirmError('');
        }
        if(username.trim() === '' || name.trim() === '' || validateEmail(email) === false || password.length < 7 || password !== confirmPassword){
            return false;
            
        }else{
            return true;
        }
    }

    const handleRegistration = (e) => {
        e.preventDefault();
        if(isValid()){
            registerUser(username, name, email, password).then(res => {
                findUserById(res.data.insertId).then(res => {
                    localStorage.setItem('user', JSON.stringify(res.data[0]));
                    setUser(res.data[0]);
                    history.push('/');
                });
            });
           
            }

            
        
    }

    return(
        <div className='registration-wrapper'>
            <form onSubmit={handleRegistration}>
                <h2 className="text-center">Napravi nalog</h2>   
                <br/>
                <div className="form-group">
                    <input type="text" className="form-control" placeholder="Korisničko ime" onChange={(e) => setUsername(e.target.value)} />
                </div>
                <p className='text-danger'>{usernameError}</p>
                <div className="form-group">
                    <input type="text" className="form-control" placeholder="Ime i prezime" onChange={(e) => setName(e.target.value)} />
                </div>
                <p className='text-danger'>{nameError}</p>
                <div className="form-group">
                    <input type="text" className="form-control" placeholder="Email" onChange={(e) => setEmail(e.target.value)} />
                </div>
                <p className='text-danger'>{emailError}</p>
                <div className="form-group">
                    <input type="password" className="form-control" placeholder="Lozinka" onChange={(e) => setPassword(e.target.value)} />
                </div>
                <p className='text-danger'>{passwordError}</p>
                <div className="form-group">
                    <input type="password" className="form-control" placeholder="Ponovljena lozinka" onChange={(e) => setConfirmPassword(e.target.value)} />
                </div>
                <p className='text-danger'>{confirmError}</p>
                <div className="form-group">
                    <button type="submit" className="btn btn-primary btn-block">Napravi nalog</button>
                </div>        
            </form>
        </div>

    )
}

export default Registration;