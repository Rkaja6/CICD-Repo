class GIE_AGSI_FacilityReport_API_Extractor_Class
{
    static int Main(string[] args)
{
 
        //https://agsi.gie.eu/api?country=AT&company=21X000000001127H&facility=21W000000000057V&size=200
        if (args.Length >= 4)
        {
            //Parameters:  API URL, API KEY
            if (args.Length == 5)
            {
                string uriSpec = args[0];
                string apiToken = args[1];
                string outputPath = args[2];
                string fileType = args[3];
                string eicCode = args[4];
                try
                {
                    HttpWebRequest fileRequest = (HttpWebRequest)WebRequest.Create(uriSpec);
                    fileRequest.Headers.Add("x-key", apiToken);
                    fileRequest.Method = "GET";
                    fileRequest.ContentType = "application/json";
                    WebResponse fileResponse = fileRequest.GetResponse();
                    Stream fileStream = fileResponse.GetResponseStream();
                    StreamReader fileReader = new StreamReader(fileStream);
                    StreamWriter fileWriter = File.CreateText(outputPath + "\\" +
                        fileType + "_" + eicCode + "_" + (uriSpec.Replace('\\', '-')
                        .Replace('.', '-').Replace('/', '-')
                        .Replace(':', '-').Replace('"', '-')) +
                        "_" + DateTime.Now.ToString("yyyyMMddhhmmss") + ".json");
                    fileWriter.Write(fileReader.ReadToEnd());
                    fileReader.Close();
                    fileWriter.Flush();
                    fileWriter.Close();
                }
                catch (Exception e)
                {
                    if (e != null)
                    {
                        Console.Write(e.Message + " ");
                        if (e.InnerException != null)
                        {
                            Console.Write(e.InnerException.Message);
                        }
                    }
                    return -1000;
                }
            }
            return 0;

        }
        else
        {

        }
        return 0;
}
}