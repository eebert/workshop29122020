package restfullbooker.runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Test;
import sun.security.provider.ConfigFile;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class TestRunner {
    @Test
    public void TestRunner(){
        System.setProperty("karate.env", "demos"); //Se tea el ambiente para ejecutar
        Results results = Runner.path("classpath:restfullbooker").tags("~@ignore").parallel( 1);
        generateReport(results.getReportDir());
    }

    public void generateReport(String karateOutputPath)
    {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration( new File( "target"),  "restFulBooker Report");
        ReportBuilder reportBilder = new ReportBuilder(jsonPaths, config);
        reportBilder.generateReports();



    }
}
