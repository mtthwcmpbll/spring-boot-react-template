package com.snowfort;

import org.junit.jupiter.api.Test;
import org.springframework.modulith.core.ApplicationModules;

class ApplicationModularityTest {

    @Test
    void verifyModularity() {
        // Build modules specifically targeting the base package instead of deriving it from the Application class
        ApplicationModules modules = ApplicationModules.of("com.snowfort");
        modules.verify();
    }
}
