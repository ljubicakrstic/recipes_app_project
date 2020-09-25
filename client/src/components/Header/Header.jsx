import React, { useEffect, useState } from 'react';
import { BrowserRouter as Router, Switch, Route, Link, Redirect, useParams } from 'react-router-dom';
import { useModal } from "react-modal-hook";
import ReactModal from "react-modal";
import { Login } from '../Login';
import './Header.css';
import { getMealGroups } from '../../services';

// const customStyles = {
//     content : {
//       top                   : '50%',
//       left                  : '50%',
//       right                 : '70%',
//       bottom                : 'auto',
//       marginRight           : '-50%',
//       transform             : 'translate(-50%, -50%)'
//     }
//   };

ReactModal.setAppElement('body');

const Header = ({user, setUser, showModal, meals}) => {


    const logOutUser = () => {
        localStorage.clear();
        setUser([]);
    }

    

    return(
        
        <nav className="navbar navbar-expand-lg navbar-light bg-light">
            <Link className="navbar-brand" to='/'>
                <img src='/logo.png' alt='' width="50" height="40" className="d-inline-block align-top"/>
            </Link>
            <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span className="navbar-toggler-icon"></span>
            </button>

            <div className="collapse navbar-collapse" id="navbarSupportedContent">
                <ul className="navbar-nav mr-auto">
                    <li className="nav-item active">
                        <Link className="nav-link" to='/'>Home <span className="sr-only">(current)</span></Link>
                    </li>
                    <li className="nav-item">
                        <Link className="nav-link" to='/addRecipe'>Novi recept</Link>
                    </li>
                    <li className="nav-item dropdown">
                        <a className="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Recepti
                        </a>
                        <div className="dropdown-menu" aria-labelledby="navbarDropdown">
                        {/* <a className="dropdown-item" href="#">Action</a>
                        <a className="dropdown-item" href="#">Another action</a> */}
                        {meals.map(meal => <Link to={`/recipes/meals/${meal.id}`} key={meal.id} className="dropdown-item">{meal.naziv}</Link>)}
                        <div className="dropdown-divider"></div>
                        <Link className="dropdown-item" to='/'>Pretraži po sastojcima</Link>
                        </div>
                    </li>
                </ul>
                {/* <p className='text-secondary my-2 my-lg-0'>{user.korisnicko_ime}</p> */}
                {user.length === 0 
                ?
                <button className="btn btn-link my-2 my-lg-0" onClick={showModal}>Uloguj se</button>
                :
                <button className="btn btn-link my-2 my-lg-0" onClick={logOutUser}>Izloguj se</button>}
            </div>
            </nav>
           
    )
}

export default Header;