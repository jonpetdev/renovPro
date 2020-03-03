package com.renovacija.validators;

import com.renovacija.model.Namas;
import org.springframework.stereotype.Component;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class NamoValidatorius implements Validator {

    @Override
    public boolean supports(Class<?> Clazz) {


        return Namas.class.isAssignableFrom(Clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Namas namas= (Namas) target;
        if ("0".equals(namas.getBankas())) {
            errors.rejectValue("bankas", "required.bankas");
        }
    }
}
