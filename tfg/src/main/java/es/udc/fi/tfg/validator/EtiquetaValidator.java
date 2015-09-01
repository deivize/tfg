package es.udc.fi.tfg.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import es.udc.fi.tfg.model.Etiqueta;

public class EtiquetaValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		return Etiqueta.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmpty(errors, "parametro","parametro.required","Necesario escoger un parametro");
		ValidationUtils.rejectIfEmpty(errors, "tecnologia", "tecnologia.required", "Necesario escoger una tecnologia");
		ValidationUtils.rejectIfEmpty(errors, "estandar", "estandar.required", "Necesario escoger un estandar");
		
	}

}
