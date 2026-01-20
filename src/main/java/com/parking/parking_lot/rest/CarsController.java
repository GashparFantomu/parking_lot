package com.parking.parking_lot.rest;


import com.parking.parking_lot.common.CarDto;
import com.parking.parking_lot.ejb.CarsBean;
import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("/cars")
public class CarsController {
    @Inject
    CarsBean carsBean;
    @GET
    @Produces("application/json")
    public List<CarDto> getCars() {
        return carsBean.findAllCars();
    }
    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public CarDto findCar(@PathParam("id") Long id) {
        return carsBean.findById(id);
    }
}
