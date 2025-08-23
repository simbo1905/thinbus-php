# thinbus-php Development Guide

## Project Overview

thinbus-php is a PHP implementation of the Secure Remote Password (SRP) protocol, providing secure authentication for web applications without transmitting passwords. It uses the test vectors of RFC5054 to verify that the code matches the specifiation. 

## Development Setup

### Prerequisites
- PHP 8.1+ (8.1, 8.2, or 8.3 supported)
- Composer for dependency management
- Git for version control

### Quick Start
```bash
# Clone the repository
git clone https://github.com/simbo1905/thinbus-php.git
cd thinbus-php

# Install dependencies
composer install

# Run tests
./vendor/bin/phpunit test/ThinbusTest.php --verbose
```

## Testing Framework

### Test Structure
- **Location**: `test/ThinbusTest.php`
- **Framework**: PHPUnit 9.6+
- **Test Count**: 16 tests, 367 assertions
- **Coverage**: Comprehensive SRP protocol functionality

### Running Tests
```bash
# Run all tests
./vendor/bin/phpunit

# Run specific test file
./vendor/bin/phpunit test/ThinbusTest.php

# Run with verbose output
./vendor/bin/phpunit test/ThinbusTest.php --verbose
```

### Test Categories
1. **Basic Functionality**: SRP protocol steps and calculations
2. **Security Validation**: Dictionary attack prevention and duplicate request handling
3. **Edge Cases**: Invalid inputs and boundary conditions
4. **Regression Tests**: Known vectors from Java implementation

### Key Test Methods
- `testStep1Step2Success`: Successful SRP protocol flow
- `testOnlyGivesOneB`: Security test for duplicate B generation
- `testOnlyValidatesOneM1`: Security test for duplicate M1 validation
- `testWithJavaValuesThinbus13`: Cross-platform compatibility verification

## Git Workflow

### Branch Strategy
- **main**: Production-ready code
- **feature/**: New features
- **fix/**: Bug fixes
- **php8x-matrix-build**: PHP version compatibility updates

### Development Process
1. **Issue Creation**: Create GitHub issue for tracking
2. **Branch Creation**: Create feature branch from main
3. **Development**: Make changes with TDD approach
4. **Local Testing**: Run tests locally before pushing
5. **PR Creation**: Submit pull request with clear description
6. **Review**: Address feedback and merge

### Example Workflow
```bash
# Start new feature
git checkout main
git pull origin main

# Create issue in GitHub
# Create branch for the issue
git checkout -b feature/new-feature-name

# Make changes
# Run tests
./vendor/bin/phpunit test/ThinbusTest.php --verbose

# Commit and push
git add .
git commit -m "feat: description of changes"
git push origin feature/new-feature-name

# Create PR in GitHub
```

## PHP Version Support

### Current Matrix
- **Supported**: PHP 8.1, 8.2, 8.3
- **Unsupported**: PHP 7.4, 8.0 (security patches discontinued)

### GitHub Actions
- **File**: `.github/workflows/php-matrix-tests.yml`
- **Matrix**: Runs tests on PHP 8.1, 8.2, 8.3
- **Triggers**: Pull requests and pushes to main

## Dependencies

### Production
- **pear/math_biginteger**: ^1.0.3 - Big integer arithmetic for SRP calculations

### Development
- **phpunit/phpunit**: ^9.6 - Testing framework

## Common Issues & Solutions

### Test Failures
1. **Missing dependencies**: Run `composer install`
2. **PHP version conflicts**: Use PHP 8.1+
3. **PHPUnit compatibility**: Ensure PHPUnit 9.6+ is installed

### Environment Issues
1. **Class not found**: Run `composer dump-autoload`
2. **Permission errors**: Ensure proper file permissions
3. **Memory issues**: Increase PHP memory limit if needed

## Security Considerations

### SRP Protocol Security
- **Dictionary attack prevention**: Tests verify only one B/M1 per session
- **Input validation**: All user inputs are securely validated
- **Cryptographic operations**: Uses secure random number generation

### Developer Guidelines
- Never commit sensitive data (passwords, keys)
- Always run security-focused tests
- Follow OWASP guidelines for web authentication

## Troubleshooting

### Test Environment
```bash
# Check PHP version
php --version

# Check Composer version
composer --version

# Check PHPUnit installation
./vendor/bin/phpunit --version

# Clear Composer cache
composer clear-cache
```

### Debug Commands
```bash
# Run single test method
./vendor/bin/phpunit test/ThinbusTest.php --filter=testMethodName

# Run with debug output
./vendor/bin/phpunit test/ThinbusTest.php --debug

# Generate coverage report
./vendor/bin/phpunit test/ThinbusTest.php --coverage-html coverage/
```
