import React from 'react';
import { Link } from 'react-router-dom';

const Categories = ({types}) => {
    return (
        <div className="card my-4">
                    <h5 className="card-header">Kategorije</h5>
                    <div className="card-body">
                      <div className="row">
                        <div className="col-lg-6">
                          <ul className="list-unstyled mb-0">
                              {types.slice(0,4).map(type => <li key={type.id}><Link to={`/recipes/types/${type.id}`}>{type.naziv}</Link></li>)}
                          </ul>
                        </div>
                        <div className="col-lg-6">
                          <ul className="list-unstyled mb-0">
                            {types.slice(4,8).map(type => <li key={type.id}><Link to={`/recipes/types/${type.id}`}>{type.naziv}</Link></li>)}
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
    )
}

export default Categories;