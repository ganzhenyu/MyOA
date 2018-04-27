package myoa.util;

public class UploadFileResult {
	 public String FileName ;
     public int Length ;
     public String Type ;
     public Boolean IsValid ;
     public String Message;
     public String FilePath;
	public UploadFileResult(String fileName, int length, String type, Boolean isValid, String message,
			String filePath) {
		super();
		FileName = fileName;
		Length = length;
		Type = type;
		IsValid = isValid;
		Message = message;
		FilePath = filePath;
	}
     
}
