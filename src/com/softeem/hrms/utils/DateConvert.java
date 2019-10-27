package com.softeem.hrms.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;


public class DateConvert implements Converter<String, Date> {
    private String pattern;
 
    public void setPattern(String pattern) {
        this.pattern = pattern;
    }
 
    @Override
    public Date convert(String source) {
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        Date d = null;
        try {
			d = format.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
        return d;
    }
}
