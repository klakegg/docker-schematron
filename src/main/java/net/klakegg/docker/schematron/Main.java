package net.klakegg.docker.schematron;

import net.klakegg.xml.schematron.SchematronCompiler;
import net.klakegg.xml.schematron.SchematronValidator;

import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 * @author erlend
 */
public class Main {

    public static void main(String... args) throws Exception {
        if (args.length < 2) {
            System.err.println("Not enough arguments provided.");
            System.exit(1);
        }

        switch (args[0]) {
            case "compile":
                try (OutputStream outputStream = Files.newOutputStream(Paths.get(args[2]))) {
                    SchematronCompiler.builder()
                            .build()
                            .compile(Paths.get(args[1]), outputStream);
                }
                break;

            case "prepare":
                try (OutputStream outputStream = Files.newOutputStream(Paths.get(args[2]))) {
                    SchematronCompiler.builder()
                            .set(SchematronCompiler.STEP3_PERFORM, false)
                            .build()
                            .compile(Paths.get(args[1]), outputStream);
                }
                break;

            case "validate":
                SchematronValidator.builder()
                        .build()
                        .validate(args[1], args[2], System.out);
                break;
        }
    }
}
