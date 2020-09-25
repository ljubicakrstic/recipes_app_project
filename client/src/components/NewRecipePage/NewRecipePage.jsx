import React from 'react';
import { useState } from 'react';
import { FileUpload } from '../FileUpload';
import NewRecipeForm from '../NewRecipeForm/NewRecipeForm';
import { BrowserRouter as Router, Switch, Route, Link, Redirect, useParams } from 'react-router-dom';

const NewRecipePage = ({ingredients, types, meals}) => {

    return(

        <div className='container-fluid'>
            <div className='row'>
                <div className='col-sm-8 offset-sm-2 mt-4'>
                    
                    <Switch>
                    <Route exact path='/'>
                        <NewRecipeForm ingredients={ingredients} types={types} meals={meals}/>
                    </Route>
                    <Route path='/image/:id'>
                        <FileUpload />
                    </Route>
                    </Switch>
                
                </div>
            </div>
        </div>
    )
}

export default NewRecipePage;