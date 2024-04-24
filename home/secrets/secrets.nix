let
  mersinvald = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDmpAXKU/IvGBRMQyX0G7//uSgnQyWoBECcNGIbVHJvvDa9LQXuxxS+SYaRrnZlhwMLdf3WkB7sS9sWtEymNi92fHNpqgDlgMosJ7/5O96tpTYwpngsY1UkWOKFSbvc7ZvYI2kzShjstzrluq6h2uqK7qmJn8s0CvZ11nPYe0anpfuTHZRBzf6VGmLRGtEpXvFa9aZDtNAsENpWGV36LuXracNZcF+iYg81ylvZN1LlemmA8W7v95R6MsJaAZWgli6JMg/sXSMSbWNzQO40TlFK+XVduljWnruST06y9wZR5F7FeG0KpqBzn9+9G0Ft+Gyn9PuyVDX0XTnh3YdtFaRZ";
  users = [mersinvald];
in
{
  "home/secrets/mc-config-json.age".publicKeys = users;
}
