package es.udc.fi.tfg.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import es.udc.fi.tfg.model.File;

public class FileValidator implements Validator {

	@Override
	public boolean supports(Class<?> paramClass) {
		return File.class.equals(paramClass);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		
		File file = (File) obj;
		
		if(file.getFile().getSize() == 0){
			errors.rejectValue("file", "valid.file","Seleccione un fichero");
		}
	}

}
