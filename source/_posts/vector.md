---
title: 向量运算复习
date: 2025-08-16
math: true
---

# 📐 向量运算复习

设  

$$
\mathbf{a} = [1,\,2,\,3], \quad \mathbf{b} = [4,\,5,\,6]
$$

---

## 1) 点积（Dot Product / 内积）

**定义**  

$$
\mathbf{a}\cdot\mathbf{b}=a_xb_x+a_yb_y+a_zb_z
$$

**几何意义**  

$$
\mathbf{a}\cdot\mathbf{b}=|\mathbf{a}|\,|\mathbf{b}|\cos\theta
$$  

- 反映两个向量的方向关系  
- 同向时取最大值，垂直时为 0  

**例子**  

$$
\mathbf{a}\cdot\mathbf{b}=1\times4+2\times5+3\times6=4+10+18=32
$$

---

## 2) 叉乘（Cross Product / 向量积）

**定义（仅三维）**  

$$
\mathbf{a}\times\mathbf{b}=
\begin{bmatrix}
a_y b_z - a_z b_y \\
a_z b_x - a_x b_z \\
a_x b_y - a_y b_x
\end{bmatrix}
$$

**几何意义**  
- 结果是一个 **垂直于 $\mathbf{a}, \mathbf{b}$ 的向量**  
- 长度为  

$$
|\mathbf{a}\times\mathbf{b}|=|\mathbf{a}|\,|\mathbf{b}|\sin\theta
$$  

- 大小等于以 $\mathbf{a}, \mathbf{b}$ 为邻边的平行四边形面积  

**例子**  




$$
\mathbf{a}\times\mathbf{b}=
\begin{bmatrix}
(2\times6) - (3\times5) \\
(3\times4) - (1\times6) \\
(1\times5) - (2\times4)
\end{bmatrix} =
\begin{bmatrix}
-3 \\
6 \\
-3
\end{bmatrix}
$$
---

## 3) 逐元素乘积（Hadamard Product）

在许多编程环境中，`a * b` 表示逐元素相乘（**非矩阵乘法**）：  

$$
\mathbf{a}*\mathbf{b}=[1\times4,\;2\times5,\;3\times6]=[4,\,10,\,18]
$$
