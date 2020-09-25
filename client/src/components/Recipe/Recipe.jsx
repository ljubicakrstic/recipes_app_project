import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { getIngredientsByRecipeId, getMealGroupsByRecipeId, getRecipeById, getTypesByRecipeId } from '../../services';
import Categories from '../Kategorija/Categories';
import './Recipe.css';

const Recipe = ({types}) => {

  const idRecipe = useParams().id;
  const [recipe, setRecipe] = useState([]);
  const [recipeIngredients, setRecipeIngredients] = useState([]);
  const [recipeTypes, setRecipeTypes] = useState([]);
  const [recipeMeals, setRecipeMeals] = useState([]);

  useEffect(() => {
    getRecipeById(idRecipe).then(res => {
      setRecipe(res.data[0]);
    });
    getIngredientsByRecipeId(idRecipe).then(res => {
      setRecipeIngredients(res.data);
    });
    getTypesByRecipeId(idRecipe).then(res => {
      setRecipeTypes(res.data);
    });
    getMealGroupsByRecipeId(idRecipe).then(res => {
      setRecipeMeals(res.data);
    })
  }, []);

  const renderInfo = (array) => {
    return array.map(el => el.length === 1 ? el.naziv : el.naziv + ' | ');
  }

    return(
    <>
    <div className="container">

      <div className="row">

        <div className="col-sm-8 blog-main mt-4">

          <div className="blog-post">
            <h1 className="blog-post-title">{recipe.naziv}</h1>
            <p><i className="far fa-clock"></i> {recipe.duzina_pripreme}</p>
            <img className='img-fluid rounded recipe-image' src={recipe.slika}/>
            <p className="blog-post-meta">{recipe.vreme} by {recipe.korisnicko_ime}</p>
            <p><i className="fas fa-utensils"></i> Tip jela: {renderInfo(recipeMeals)}</p>
            <p><i className="fas fa-hamburger"></i> Napomene: {renderInfo(recipeTypes)}</p>

            <p>{recipe.opis}</p>
            <hr/>
            <h3>Sastojci</h3>
            <ul>
              {recipeIngredients.map(el => <li key={el.naziv}>{el.kolicina} - {el.naziv}</li>)}
            </ul>
            <h3>Postupak</h3>
            <p>{recipe.uputstvo}</p>
           
          </div>

        </div>

        <div className="col-sm-3 offset-sm-1 blog-sidebar">
          <div className="sidebar-module sidebar-module-inset">
            <h4>About</h4>
            <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>
          </div>
          <div className="sidebar-module">
            <Categories types={types} /> 
          </div>
        </div>

      </div>

    </div>
    </>
    )
}

export default Recipe;