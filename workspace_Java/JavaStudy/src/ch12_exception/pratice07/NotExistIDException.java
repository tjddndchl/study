package ch12_exception.pratice07;

public class NotExistIDException extends Exception{
	public NotExistIDException() {}
	
	public NotExistIDException(String message) {
		super(message);
	}
	
}
