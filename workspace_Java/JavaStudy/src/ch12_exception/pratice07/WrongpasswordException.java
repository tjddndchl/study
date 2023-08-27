package ch12_exception.pratice07;

public class WrongpasswordException extends Exception{
	public WrongpasswordException() {}
	public WrongpasswordException(String message) {
		super(message);
	}
}
