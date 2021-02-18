import React, { useState, useEffect } from 'react';

function VehicleListItem(props) {
  const { brand_name, model_name, price, mileage, year } = props;

  return (
    <div className="col-3">
      <div className="card vehicle-card text-dark bg-light mb-3">
        <div className="card-header">{brand_name} / {model_name}</div>
        <div className="card-body">
          <h5 className="card-title">$ {price}</h5>
          <p className="card-text mb-0">Kilometraje: {mileage} </p>
          <p className="card-text">Year: {year}</p>
        </div>
      </div>
    </div>
  );
}

export default VehicleListItem
