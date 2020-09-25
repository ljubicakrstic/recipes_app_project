import React  from 'react';
import { Link } from 'react-router-dom';

const RecipeCard = ({recipe}) => {

    return(
        <div className="card mb-4">
            <img className="card-img-top" src={recipe.slika} alt={recipe.naziv}/>
            <div className="card-body">
                <h2 className="card-title">{recipe.naziv}</h2>
                <p className="card-text">{recipe.opis}</p>
                <Link className="btn btn-primary" to={`/recipe/${recipe.id}`}>Detaljnije &rarr;</Link>
            </div>
            <div className="card-footer text-muted">
                Objavljeno {recipe.vreme}
            </div>
      </div>
    )
}

export default RecipeCard;