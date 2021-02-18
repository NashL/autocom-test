import React from 'react';
import VehicleListItem from './VehicleListItem';

function VehicleList(props) {
  return (
    <div className="row mt-5">
      {props.vehicles.map((vehicle, idx) => (
        <VehicleListItem key={idx} {...vehicle} />
      ))}
    </div>
  )
}

export default VehicleList