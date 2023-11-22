
---

## 통계적 가설검정: 이론, 실습 및 적용 예시

### 1. 정규성 검정: Shapiro-Wilk Test

#### 이론 및 적용 상황
- 목적: 데이터의 정규 분포 여부 확인
- 적용 예시: 연구 데이터가 정규 분포를 가정하는 분석 방법을 사용하기 전에 정규 분포를 따르는지 확인할 필요가 있음

#### 실습
```python
from scipy import stats

data = [5, 7, 9, 11, 10]
shapiro_test = stats.shapiro(data)
```

---

### 2. 회귀모형: 선형 상관계수

#### 이론 및 적용 상황
- 목적: 두 변수 간의 선형 상관관계 측정
- 적용 예시: 체중과 심장 건강 지수 간의 관계 파악

#### 실습
```python
from scipy import stats

x = [1, 2, 3, 4, 5]
y = [2, 4, 5, 4, 5]
regression_result = stats.linregress(x, y)
```

---


### 3. 단일표본 T검정

#### 이론 및 적용 상황
- 목적: 단일 샘플 평균과 기준값 비교
- 적용 예시: 제품의 평균 수명이 제조사의 주장과 일치하는지 검정

#### 실습
```python
from scipy import stats

data = [2, 3, 5, 6, 9]
ttest_1samp = stats.ttest_1samp(data, popmean=5)
```
---

### 4. 대응표본 T검정

#### 이론 및 적용 상황
- 목적: 동일 대상의 전후 차이 분석
- 적용 예시: 환자에게 새로운 치료법을 적용하기 전후의 건강 지수 변화 분석

#### 실습
```python
from scipy import stats

before = [20, 21, 22, 23, 22]
after = [25, 22, 24, 24, 23]
ttest_rel = stats.ttest_rel(before, after)
```

---

### 5. 독립표본 T검정

#### 이론 및 적용 상황
- 목적: 두 독립적 집단 간 평균 차이 분석
- 적용 예시: 두 다른 학교 학생들의 시험 점수 비교

#### 실습
```python
from scipy import stats

group1 = [20, 21, 22, 23, 22]
group2 = [25, 26, 28, 29, 30]
ttest_ind = stats.ttest_ind(group1, group2)
```

---

### 6. 일원배치 ANOVA

#### 이론 및 적용 상황
- 목적: 세 개 이상의 그룹 간 평균 차이 분석
- 적용 예시: 세 가지 다른 식단이 체중 감량에 미치는 효과 비교

#### 실습
```python
from scipy import stats

group1 = [20, 21, 22, 23, 22]
group2 = [25, 26, 28, 29, 30]
group3 = [20, 19, 18, 17, 16]
anova = stats.f_oneway(group1, group2, group3)
```

---
### 일원배치 ANOVA 결과 해석

1. **P-값(P-value) 확인**
   - P-값은 분산분석 결과에서 중요한 역할을 합니다. 이 값은 귀무가설(모든 그룹의 평균이 같다는 가설)이 참일 확률을 나타냅니다.
   - 일반적으로 사용되는 유의수준은 0.05(5%)입니다.

2. **유의수준과 비교**
   - P-값이 유의수준(예: 0.05)보다 작으면 귀무가설을 기각합니다. 이는 적어도 한 그룹 간에는 통계적으로 유의미한 평균 차이가 있다는 것을 의미합니다.
   - P-값이 유의수준보다 크면 귀무가설을 기각할 수 없습니다. 즉, 모든 그룹 간의 평균 차이가 통계적으로 유의미하지 않다는 것을 의미합니다.

3. **F-통계량(F-statistic)**
   - F-통계량은 그룹 간 분산과 그룹 내 분산의 비율을 나타냅니다. 높은 F-값은 그룹 간 분산이 그룹 내 분산보다 상대적으로 크다는 것을 의미하며, 이는 귀무가설에 반하는 증거가 될 수 있습니다.

4. **사후 검정(Post-hoc tests)**
   - 만약 P-값이 유의수준보다 작아 귀무가설이 기각된 경우, 어떤 그룹들 간에 차이가 있는지 구체적으로 파악하기 위해 사후 검정을 실시할 수 있습니다. 예를 들어, Tukey의 HSD(Honestly Significant Difference) 테스트와 같은 사후 검정 방법이 사용될 수 있습니다.

### 예시

- 가정: 세 가지 다른 식단 프로그램에 대한 체중 감량 효과를 비교하는 연구에서 일원배치 ANOVA를 실시했다고 가정해 봅시다.
- 결과: ANOVA 결과 P-값이 0.03이 나왔다고 합시다.
- 해석: P-값이 0.05보다 작으므로, 세 가지 식단 프로그램 간에는 통계적으로 유의미한 차이가 있다고 할 수 있습니다. 즉, 적어도 한 프로그램은 다른 프로그램들과 비교했을 때 체중 감량에 있어 통계적으로 유의미한 차이를 보인다는 결론을 내릴 수 있습니다.

이러한 결과는 추가적인 사후 검정을 통해 어느 그룹들 간에 차이가 있는지를 구체적으로 파악하는 데 사용될 수 있습니다.

### 단측검정과 양측검정

#### 기본 개념
- **단측검정 (One-tailed test)**: 특정 방향으로의 효과나 차이만을 검정합니다. 예를 들어, "A는 B보다 크다" 또는 "A는 B보다 작다"와 같은 가설을 검정할 때 사용합니다.
- **양측검정 (Two-tailed test)**: 양쪽 방향으로의 차이를 모두 고려하여 검정합니다. 즉, "A와 B는 다르다"와 같은 가설을 검정할 때 사용합니다.

#### 선택 기준
- **단측검정**은 연구자가 특정 방향의 차이에만 관심이 있을 때 사용합니다. 예를 들어, 새로운 약이 기존 약보다 더 효과적이라는 것을 증명하고자 할 때 적합합니다.
- **양측검정**은 어느 방향으로든 차이가 있을 가능성을 열어두고 검정하고자 할 때 사용합니다. 대부분의 과학적 연구에서는 양측검정을 사용합니다.

#### 통계적 접근

1. **가설 설정**
   - 단측검정: 귀무가설 H₀ (예: μ ≤ μ₀), 대립가설 H₁ (예: μ > μ₀)
   - 양측검정: 귀무가설 H₀ (예: μ = μ₀), 대립가설 H₁ (예: μ ≠ μ₀)

2. **유의수준과 임계값**
   - 단측검정: 유의수준(α)의 임계값을 한 방향으로만 고려합니다.
   - 양측검정: 유의수준을 양쪽 꼬리에 분배하여 임계값을 설정합니다. 예를 들어, α = 0.05인 경우, 각 꼬리에 0.025씩 할당합니다.

3. **검정 통계량 계산**
   - T검정, Z검정 등에서 계산된 검정 통계량을 사용합니다.

4. **결론 도출**
   - 단측검정: 검정 통계량이 임계값보다 크거나 작은지에 따라 귀무가설을 기각 또는 채택합니다.
   - 양측검정: 검정 통계량이 양쪽 꼬리의 임계값 중 하나보다 크거나 작은지에 따라 결정합니다.

#### Python 예시: 단측 T검정

```python
from scipy import stats

# 데이터 예시
data = [2, 3, 5, 6, 9]

# 단일표본 T검정 (단측)
t_statistic, p_value = stats.ttest_1samp(data, popmean=5)

# 단측검정을 위한 P-값 조정
p_value_one_tailed = p_value / 2 if t_statistic > 0 else p_value

# 결론 도출
if p_value_one_tailed < 0.05:  # 예를 들어 유의수준이 0.05인 경우
    print("귀무가설 기각, 대립가설 채택")
else:
    print("귀무가설 채택, 대립가설 기각")
```

단측검정과 양측검정은 연구의 목적과 가설에 따라 적절히 선택해야 하며, 검정의 방향이 연구 결과의 해석
에 중요한 영향을 미칩니다.