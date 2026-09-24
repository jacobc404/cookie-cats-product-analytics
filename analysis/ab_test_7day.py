import math

# gate_30
n1 = 44700
x1 = 8502

# gate_40
n2 = 45489
x2 = 8279

p1 = x1 / n1
p2 = x2 / n2
diff = p2 - p1

# two-proportion z-test (pooled standard error)
pooled = (x1 + x2) / (n1 + n2)
se_test = math.sqrt(pooled * (1 - pooled) * ((1 / n1) + (1 / n2)))
z = diff / se_test

def norm_cdf(x):
    return (1 + math.erf(x / math.sqrt(2))) / 2

p_value = 2 * (1 - norm_cdf(abs(z)))

# 95% CI for absolute difference (unpooled standard error)
se_ci = math.sqrt((p1 * (1 - p1) / n1) + (p2 * (1 - p2) / n2))
ci_low = diff - 1.96 * se_ci
ci_high = diff + 1.96 * se_ci

print(f"gate_30 retention_7: {p1:.4%}")
print(f"gate_40 retention_7: {p2:.4%}")
print(f"absolute diff: {diff * 100:.3f} percentage points")
print(f"z-stat: {z:.4f}")
print(f"p-value: {p_value:.6f}")
print(f"95% CI: [{ci_low * 100:.3f}, {ci_high * 100:.3f}] percentage points")