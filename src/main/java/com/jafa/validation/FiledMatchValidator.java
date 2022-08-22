package com.jafa.validation;

import java.lang.reflect.InvocationTargetException;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.apache.commons.beanutils.BeanUtils;

import com.jafa.common.FiledMatch;

public class FiledMatchValidator implements ConstraintValidator<FiledMatch, Object>{

	private String firstFieldName;
	private String secondFieldName;
	private String message; // 에러메시지
	
	
	@Override
	public void initialize(FiledMatch constraintAnnotation) {
		firstFieldName = constraintAnnotation.first();
		secondFieldName = constraintAnnotation.second();
		message = constraintAnnotation.message(); //프로그래머가 설정한 값 또는 기본값
	}

	@Override
	public boolean isValid(Object value, ConstraintValidatorContext context) {
		boolean valid = true;
		// 검증
		try {
			Object firstobj = BeanUtils.getProperty(value, firstFieldName);
			Object secondobj = BeanUtils.getProperty(value, secondFieldName);
			valid = firstobj != null && secondobj!=null && firstobj.equals(secondobj);
			if(!valid) {
				context.buildConstraintViolationWithTemplate(message)
				.addPropertyNode(firstFieldName)
				.addConstraintViolation()
				.disableDefaultConstraintViolation();
				//메시지를 첫번째 필드에 전달하겠다 요정도로 기억
			}
			
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		return	valid;
	}

}
