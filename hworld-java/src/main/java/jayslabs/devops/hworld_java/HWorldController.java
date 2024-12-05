package jayslabs.devops.hworld_java;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HWorldController {

    @GetMapping("/")
    public String helloWorld() {
        return "{\"message\": \"Jay's java HWorld! v1\"}";
    }
}
