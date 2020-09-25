import React, { useEffect, useState } from 'react';
import ReactDOM from 'react-dom';
import Home from './components/Home/Home';
import './index.css';
import { getIngredients, getMealGroups, getRecipeTypes } from './services';
import { BrowserRouter as Router, Switch, Route, Link, Redirect, useParams } from 'react-router-dom';
import Header from './components/Header/Header';
import { FileUpload } from './components/FileUpload';
import NewRecipeForm from './components/NewRecipeForm/NewRecipeForm';
import Recipe from './components/Recipe/Recipe';
import { ModalProvider } from "react-modal-hook";
import Registration from './components/Registration/Registration';
import ReactModal from "react-modal";
import { useModal } from "react-modal-hook";
import { Login } from './components/Login';
import Recipes from './components/Recipes/Recipes';

const customStyles = {
  content : {
    top                   : '50%',
    left                  : '50%',
    right                 : '70%',
    bottom                : 'auto',
    marginRight           : '-50%',
    transform             : 'translate(-50%, -50%)',
    backgroundImage       : 'url("/spoons-small.jpeg")',
  }
};

const App = () => {

  const [user, setUser] = useState([]);
  const [ingredients, setIngredients] = useState([]);
  const [types, setTypes] = useState([]);
  const [meals, setMeals] = useState([]);


  // console.log(user);

  const [showModal, hideModal] = useModal(() => (

    <ReactModal isOpen style={customStyles}>
        <button onClick={hideModal} className=" btn btn-link float-right">X</button>
        <br/><br/>
        <Login hideModal={hideModal} setUser={setUser}/>
    </ReactModal>

));

  useEffect(() => {
    getIngredients().then(res => {
      setIngredients(res.data);
    });
    getRecipeTypes().then(res => {
      setTypes(res.data);
    })
    getMealGroups().then(res => {
      setMeals(res.data);
    })
  }, []);
  
    return (

      <>
    {/* // <Router> */}
      <Header user={user} setUser={setUser} showModal={showModal} meals={meals}/>
      <Switch>
        <Route exact path='/'>
          <Home types={types} />
        </Route>
        <Route exact path='/recipes/meals/:id'>
          <Recipes types={types} sortBy={'meal'}/>
        </Route>
        <Route exact path='/recipes/types/:id'>
          <Recipes types={types} sortBy={'type'} />
        </Route>
        <Route exact path='/registration'>
          <Registration setUser={setUser}/>
        </Route>
          <Route exact path="/recipe/:id">
              <Recipe types={types}/>
          </Route>
          <Route exact path="/addRecipe">
             {user.length !== 0 ? <NewRecipeForm ingredients={ingredients} types={types} meals={meals}/> : <Redirect to='/'/> }
          </Route>
          <Route exact path="/addRecipe/image/:id">
              <FileUpload />
          </Route>
      </Switch>
      {/* {user ? <Contact /> : <Redirect to="/login" />} */}
  {/* </Router> */}
</>


    )
}

ReactDOM.render(
  // <React.StrictMode>
  <Router>
    <ModalProvider> 
        <App />
    </ModalProvider>
  </Router>,
//  </React.StrictMode>, 
  document.getElementById('root')
);


