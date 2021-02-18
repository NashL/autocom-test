import React, { useState, useEffect, useCallback } from 'react';

function Filters(props) {
  return (
    <div className="filters-container">
      <div className="row justify-content-center">
        <div className="col-auto">
          <input type="text" className="form-control" placeholder="Search" onChange={ (e) => props.setQuery(e.target.value)}/>
        </div>
        <div className="col-auto">
          <select className="form-select" onChange={ e => props.setType(e.target.value) }>
            <option value="model">Model</option>
            <option value="brand">Brand</option>
            <option value="year">Year</option>
            <option value="mileage">Mileage</option>
            <option value="price">Price</option>
          </select>
        </div>
        <div className="col-auto">
          <button className="btn btn-primary" type='button' onClick={() => props.setLoading(true)}> Filter </button>
        </div>
      </div>
    </div>
  )
}

export default Filters;