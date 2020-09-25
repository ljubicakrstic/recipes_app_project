import React, { useEffect, useState } from 'react';
import { getAllRecipes } from '../../services';
import Header from '../Header/Header';
import Categories from '../Kategorija/Categories';
import Pagination from '../Pagination/Pagination';
import RecipeCard from '../RecipeCard/RecipeCard';

const Home = ({types}) => {


    const [recipes, setRecipes] = useState([]);
    const [start, setStart] = useState(0);

    useEffect(() => {
        getAllRecipes().then(res => {
            setRecipes(res.data);
        });
    }, []);

    return (
        
        <div className="container">
      
          <div className="row">
      
            
            <div className="col-md-8">
      
              <h1 className="my-4">Najbolji recepti
                <small> Na jednom mestu</small>
              </h1>
      
            {recipes.slice(start, start + 3).map(recipe => <RecipeCard key={recipe.id} recipe={recipe}/>)}
            <Pagination start={start} setStart={setStart} recipes={recipes} />
            </div>
      
            
            <div className="col-md-4">

            <div className="card my-4">
                    <h5 className="card-header">Search</h5>
                    <div className="card-body">
                      <div className="input-group">
                        <input type="text" className="form-control" placeholder="Search for..."/>
                        <span className="input-group-append">
                          <button className="btn btn-secondary" type="button">Go!</button>
                        </span>
                      </div>
                    </div>
                  </div>

              <Categories types={types} /> 
             
            </div>
      
          </div>
          
      
        </div>
    )
}

export default Home;