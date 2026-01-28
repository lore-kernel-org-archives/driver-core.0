Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8AB29A1
	for <driver-core@lists.linux.dev>; Wed, 28 Jan 2026 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769589283; cv=none; b=j8l8rerbpB1a/xoMJliZRNO4qGzLxrsvPD2PN7LbKJ5KCmJo/N4X25nH34t9B6eHF7ZsYMTH6C3rAnFC0ZhnFaiNrOoT34cyvbeCWmJPBrPHV5Tgc1zTtCVGVwj9KBW0HasD8ruqF/ylW1gdM6pgSX7R2liIDb3m6t6IRTVyR2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769589283; c=relaxed/simple;
	bh=4GoATlini5cili1q/r1KvCweFB/L3qHkAYqZeZLC6mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lPTiEoDAbqqwG7uSwhhDg3wleMtyZKPVILdzGYGj1kIZ+F/cvF2q6Y6lid+XCgKRiSIhQqfx/Z64GJ/KOjny0pmLWdrCqd/TDoR7guA5QOx0/bjHHYJqaWucZdLiPqQhA0XBiV+95R3LHlFZBVb+SnzilzZ/CJH7RPu+jj1vZnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lGbKw+I9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhxNubAI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lGbKw+I9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MhxNubAI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S3X1mE2728617
	for <driver-core@lists.linux.dev>; Wed, 28 Jan 2026 08:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cM4YbbwLxlZdfa/MZFQvlcZ2nOy3bOu5nF8W7uOLFm0=; b=lGbKw+I9Akb8+JeN
	FNznUn4dYRHgNc9AE9xDho7KEPgFPgMVeJDVj0ux3SPp4M+VclSG0jc5hvKr9sZo
	7GXD8AuISrFE10THJ1Uh+St09Urv28hxMGVYpARkIMl/j03oW/ZyxUp/xuFKD9xt
	6NFXAp98SxfAw0uYGIz4CLsmwHJG3gNAdPrK9W/urRXXszKIJ3NmYq3DZYf1/UJ9
	mZ5InWanGkhlWY9896Ci6BXXgk0ZFubrp4Br0vONjFfkNbtTymSuUFaB1cjR9D1b
	Ljm0PYMo0e5rmrLQYBDr91A88R6q1bBLtuE5R6hifg4vMMUN3jEmCNrLWJKgx2DI
	mEh1JQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byanaguub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 28 Jan 2026 08:34:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6deddd7f7so1436548585a.3
        for <driver-core@lists.linux.dev>; Wed, 28 Jan 2026 00:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769589281; x=1770194081; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cM4YbbwLxlZdfa/MZFQvlcZ2nOy3bOu5nF8W7uOLFm0=;
        b=MhxNubAIdp0If6IiSo7mvm8hqrZBFOMhbUjqZPIqfByB+3O6HBzf2w1Sz5l3IgQvQU
         U2Rn9ICK5V+jfetACgj5GAnBwbEJj1NIbHGqY8jDxSI6QsCsV4DkjPBOxCyotqJKUlFh
         Lln9NZOAT774BEsHUzRAt97l7RIirx2AeqTZDkohmfBouro4mja6WMRepZMcNu0qDz9z
         RLbAjxcdWoGKWi0fWUUBnY5owBfyNwqKQw38utTOb3LPRn7leSKoHTHTqtX1B+CAX5hT
         lXeGwJpz4vJx7OrhmNkZW+CNEB4baWf05UalRSPhcxlUmOeRVB9ffb8YR8Pwet6Ngmzo
         LHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769589281; x=1770194081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cM4YbbwLxlZdfa/MZFQvlcZ2nOy3bOu5nF8W7uOLFm0=;
        b=YCGDmXiwSR/qoK6fuzKdiZv6mrOomyCq1e8L4reMXq1SMua2vmXqg/Q3OBZHYvRbxx
         9oO0U2n2OLoW5zE3mgRvczGQgPwDlVyY34grC1R3R8j8EV8i9CT+ZkjdUdq9IqwZqIiu
         JyonUUyVuCjIwywwihJMJtwVJSfjFWvA0kFqDq3ox9gvkBH1d0ZBP0SzyeU1Ile89Y/t
         cx+zBVwUtMzzZLLJlP8s27FyaeikHdbZBPk0XOHm2DGfV3vDEaRjmFfZRZTy8dw1YqwC
         PXQGDzEGdfUU5loWPj5uA9GeBeBq79CR73oZ508efpiMi6l0GFfOvWgmmgRgciHI/o8Y
         XORQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQuxBQMYtD5vpgzaYvKg2TlE3iCE0FgLPdHioRq4VRz43tWLGj6AguXEELjdeTk44SmoKNT2fx4IgZdg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDg5fQR0ZNe8CwIYxbgKq5W6fCkR0lNuKZue7u+WSTluUutLOi
	wGpyQmHC5JNQLg+Dn6wcifY78o6LaKa5n6nQU3xdhFXYlK3/2x/qTskJFq4rZEZ5ewDlcr+fLbW
	1mEUpo5cqbsQLgjx3Yir+gtR3ewxfJAHR5gcIG3CFdeyXn7LewESsbrN2w/FmAL2zRw==
X-Gm-Gg: AZuq6aJ0gvQ5+Qah9Z2s+oF39TSryCMNjvd9h0t51K0Ciy7ALazrcda31m/7Lw9exbh
	ccn3N8DxQmfzjyZcsIGB/z4BGsvmht5TcPlYQ2t3Q3KE0ITRABay7V6o1lw9liUqhiLWgZnNxsj
	2UO3ttxuN126IjLxwpyyUJHlKSmbFwxDk+6KgFz4sSu8mEB0EgYnfN/0ILWAN1CflbPXijcOwZ9
	TMfDvVhjqdOZ5O08rR3+QbqeEscINp6LGFqB17XW4HO3Y2be08/WGYaVr/ohCSiO+Whj6z6J4+e
	FBh7xFV0Fv6vqFj5UTql9Hqlxlug1qeOGpriJRPtFeecDhRpRQ0QUkICrTAvZB4N/rf7muNxZ7m
	9lLkqSOxgXjn0/RLHQnfbdvRaVwAr1tNP4JTY7Q==
X-Received: by 2002:a05:620a:4507:b0:8c7:6f8:ae4c with SMTP id af79cd13be357-8c70b8d11b9mr554088185a.43.1769589280771;
        Wed, 28 Jan 2026 00:34:40 -0800 (PST)
X-Received: by 2002:a05:620a:4507:b0:8c7:6f8:ae4c with SMTP id af79cd13be357-8c70b8d11b9mr554086485a.43.1769589280324;
        Wed, 28 Jan 2026 00:34:40 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6cbc:dfde:e62d:3195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c515sm45165645e9.11.2026.01.28.00.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:34:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org, broonie@kernel.org,
        will@kernel.org, grygorii.strashko@ti.com, ssantosh@kernel.org,
        khilman@kernel.org, linusw@kernel.org, brgl@kernel.org,
        Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpio: omap: do not register driver in probe()
Date: Wed, 28 Jan 2026 09:34:37 +0100
Message-ID: <176958902316.4537.1901338597465599154.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127201725.35883-1-dakr@kernel.org>
References: <20260127201725.35883-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VN-l40RLrRsAEap8Ufpvux3pkDxfDfd-
X-Proofpoint-ORIG-GUID: VN-l40RLrRsAEap8Ufpvux3pkDxfDfd-
X-Authority-Analysis: v=2.4 cv=N58k1m9B c=1 sm=1 tr=0 ts=6979ca21 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NmoZXNGLfAXcYQ8gNhMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA2OSBTYWx0ZWRfX6y4fwhk2QB//
 +q/7xuh5XUIt6omezlCvUTwDs4DbDJt38hGQdwQZ8k3BNAH1l4owNZt4D+sjQr3r4crcHlxoN6/
 xIXS9AuQT/qtAICl52PQcAq0YhfBdojzg40DC5bk0DQPkkQl8r+hU0s2tjOjuVUMJh1om2Mtkzo
 lu8l+gmM8eC6yrp60WolsTg78ZTCrFLh3BHLjRd7XTqxs3hOh6Vd1GI/R6FNJHlcXN6foEI02LV
 rkMuHqjqmJSdG3qnGmEVLPfbTpLuA5EvPHlF8Orp8KZxqLOPs8PrJHyEQhkYpT1NPBD405A6whS
 lqiV4tDMoE1DajWcXMrIqnd/NufBr4maIg79cl/crs6TaIAsqPs6QQ0dwQ3bpBw3U6GEa0LM9ak
 sxOx7WzHPOBnlJY1bESoC4jnOJRduuEgyuvCmlyCvBbEte9T23YkpOX/eUP8FUDu2RMPcx9qTbS
 qDy38G3P1o8ywJs0o/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280069


On Tue, 27 Jan 2026 21:17:12 +0100, Danilo Krummrich wrote:
> Commit 11a78b794496 ("ARM: OMAP: MPUIO wake updates") registers the
> omap_mpuio_driver from omap_mpuio_init(), which is called from
> omap_gpio_probe().
> 
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
> 
> [...]

Applied, thanks!

[1/1] gpio: omap: do not register driver in probe()
      https://git.kernel.org/brgl/c/730e5ebff40c852e3ea57b71bf02a4b89c69435f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
