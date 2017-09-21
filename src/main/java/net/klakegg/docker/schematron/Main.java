package net.klakegg.docker.schematron;

import net.klakegg.xml.schematron.SchematronCompiler;
import net.klakegg.xml.schematron.SchematronValidator;

import java.nio.file.Paths;

/**
 * @author erlend
 */
public class Main {

    public static void main(String... args) throws Exception {
        if (args.length == 0) {
            System.err.println("No arguments provided.");
            System.exit(1);
        }

        switch (args[0]) {
            case "compile":
                SchematronCompiler.builder()
                        .build()
                        .compile(Paths.get("../src", args[1]), System.out);
                break;

            case "prepare":
                SchematronCompiler.builder()
                        .set(SchematronCompiler.STEP3_PERFORM, false)
                        .build()
                        .compile(Paths.get("../src", args[1]), System.out);
                break;

            case "validate":
                SchematronValidator.builder()
                        .set(SchematronValidator.FOLDER, Paths.get("../src"))
                        .build()
                        .validate(args[1], args[2], System.out);
                break;
        }
    }
}
