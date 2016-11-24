# Hello Spring Boot

## Run

1. gradle wrapper

  ```bash
  gradle wrapper
  ```

1. edit wrapper distributionUrl

  Edit ./gradle/wrapper/gradle-wrapper.properties

  ```properties
  distributionUrl=${local_gradle_zip_file}
  ```

1. run spring boot

  ```bash
  ./gradlew bootRun
  ```
