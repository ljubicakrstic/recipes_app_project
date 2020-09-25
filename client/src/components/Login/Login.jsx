import React, { useState } from 'react';
import { findUser } from '../../services';
import { useHistory } from 'react-router-dom';
import './Login.css';

const Login = ({hideModal, setUser}) => {   

    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');

    const history = useHistory();

    const handleLogIn = (e) => {
        e.preventDefault();
        findUser(username, password).then(res => {
            if(res.data.length === 0){
                setError('Neispravni podaci');
            }else{
                localStorage.setItem('user', JSON.stringify(res.data));
                setUser(res.data[0]);
                hideModal();
            }
        });
    }

    return(    
            <div className='login-form-wrapper'>
                <form onSubmit={handleLogIn}>
                    <h2 className="text-center">Uloguj se</h2>   
                    <p className="text-center text-danger">{error} </p>   
                    <div className="form-group">
                        <input type="text" className="form-control" placeholder="Korisničko ime" required="required" onChange={(e) => setUsername(e.target.value)} />
                    </div>
                    <div className="form-group">
                        <input type="password" className="form-control" placeholder="Šifra" required="required" onChange={(e) => setPassword(e.target.value)} />
                    </div>
                    <div className="form-group">
                        <button type="submit" className="btn btn-primary btn-block">Uloguj se</button>
                    </div>
                    <div className="clearfix">
                        Nemate nalog?<button className='btn btn-link' type='button' onClick={() => {history.push('/registration'); hideModal()}}>Registrujte se</button>
                    </div>        
                </form>
            </div>  

                
    

            
         
    )
}

export default Login;