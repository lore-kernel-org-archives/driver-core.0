Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751716;
	b=hcO5D9wEmY3w320q6xICpKGM+8wTu08O/y5ngdI0kXQ0IVehecVaDQP3DUww/nJEHLXg
	 B460Vk5uYAD4r1A2Xk8w3126fnb6EzJUuTYqof636TOBtKA91E6tqjC2fL/HKEuGeJ2pI
	 rjUy54Di5F6v5H/F6h9kK17bQmP2+oZ4XvYIOH0ybtsJNCmnqKvGZu/RSTz7OfaWp6APs
	 hnAhGuGvGbt+vqQLgOpQe+Pzdl8siFqjBuvB1E6A0oHsNnpkGRRWUbSPiVI4hTvqqAJcW
	 ttQlWb8UImGUbTvW3rFctlgjFToWskxJFAVyOr3AotvznqY4ZJBoaqfCd3M0h9IaEDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zheX+XNXZRQsqnxaQohoj/DUJpNDERXKGAb12Po/cyU=;
	b=yNv7SBVDqzYTbeDc0kFoZMLQZWxsGN196Zd69AXea4wJXW2jNW1OVlWZPRTvbAAlTiyl
	 cRLaPTw0dLbtIqL3a7vZd1zPayo2mtHH7VFHYi38MprLoe6bhx4t6DTAH91fga0SCilBU
	 swtpin+0sB7R61ol72kXhpw3YoE74YutwEvrcfhhEAfxDvhWc+R+5NzjVDVJ/nPqbgpqC
	 ZctwPRqir1caqFlQDYUr3iDu3wQgBSzOYQ/1PCl8juiC30aiMC+5qdWVDc3YKbpAuZZ+J
	 O7EmrSTL8vMQV/QvFS0gJQIuODbdQKof1BbVu7PZYQcSTMad3s3zpaZ1L70qbQomJ7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fmihigxl;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9A3606A32D
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 10:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB9A3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fmihigxl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so423097f8f.0
        for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 03:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792751709; x=1793356509; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zheX+XNXZRQsqnxaQohoj/DUJpNDERXKGAb12Po/cyU=;
        b=fmihigxlAELhiQXxHAuMRTgUrRvFB/DBiXeQuDCG/667RyUPxeqwqYHOPp7LYNyYlF
         VThGmkg4B5g1s337qLXh6Tg5AroCZ8wLQnYR8T2CP0N5bLSEFxQUfJeDpp3fla/buXKb
         n+kihZYRaDzITOEbUDg+vEQLOxXVsq5N/dPqcz/nyLDxZsEVs2ddqX2cI80zYIeLBgKn
         GEj8/2vxwApbOomdywKmM+wdBkph2KbAJqPy+LZNXGRe+bvnNCx/T860RGNTf0nJTcmV
         HsQ2HyGigVoR2iQ/C5Mg62hzUH1A6nFqKWnOWXphuHI5Cb7G0aogs4hXaujTKqhFB/8i
         YPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751709; x=1793356509;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zheX+XNXZRQsqnxaQohoj/DUJpNDERXKGAb12Po/cyU=;
        b=sIyP19DrNn0KiqP0t3J8cCxIdmseMDrHQEF2mXTKzhI7e0VRHeD7dluYfgaHbJEFq0
         RCWo+1ENNAi8iXr6Yxa1lBNH1rm5H5GeIX0IavrbnnrWxeJcZJ5F9yZn2QL38RyZjcPP
         SHJA9AQqbTI0jzMzl9vNS/qth/b/Aid7tYgkRyJbHzw9HdF9dL3HYvqpujEAkJ1nmdHh
         kNHJW477ZUPrKxVcjO59O5Z5bTdCo+I8p0XaOKFLL4hOZiVgTSJAAUi80dQg0+USBjVF
         zwq/4agtzyJX89HvXMA10iA6ztuSXVVAmzOKb5agAbNQHsvvfiJZub742/5lqOkeuiy5
         6w2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxusWpKWtm1cxLP1MTDFgg6zxVd3t9y7jsgeq8/LCSJsODgOYiaHZQf6RkZIHmgAsHNWqu0iLnjDz/o7g==@lists.linux.dev
X-Gm-Message-State: AFq9FYLpFO6GcNrOumDSxBocV9g0HXzVRvnArVVRXJckkN0VuEEos9ul
	JspDkonZ+1CFq/nxFrELW/BmW4Q7paEHUdpe3VGFF2IMhLJufntvDwndeXmFUJXse6c=
X-Gm-Gg: AYBFou0nESE8J/sneIS7/t6f3W+X+Iy0D+vpCE/J1cz7Yj23eKFOmzWekCzRZw9LwUg
	3W6mJCLFnnLfMA0cWygXvNDZuUgXYDjGa4HmcQS1jJzeiOV4M/bSniMnfwoL/r+BB98vmEv3XQB
	57ZQQGhI6rNnvQTH5+Y+w8ZrC243pcMiEoW+uWpcId2xLJsO5YFbgRVKx224T782v+mHWuAXWhP
	XmVmxmjAjpaPBECygwPrY80tp0abLG7VnNeODhQRvxcDFpE87akgp3E2uwo9P5+UPgFDNCTPuoC
	+OoUYhWMxWFrvgV2cRWjeu1VPtPZGVMvIjCRDHDppz4FtgB8J2xUbSkOomv9i0OBMOKcNlYEEQ7
	uOsqIKaCB3i85FC/BBn+JOmNszwHN/Y1Fqx+yDv1MfxMSxqENl80AAhGsNW75UK3pxoCQdnJ3sk
	IUY8lF05kK47W0DGk9lTIWphNy3EAFMYOno2xfCSaEfnWzAp18DKgLlu3HqarZXmpkn8xZkj52u
	eG8+suf4IP8SALREH7bKk6Ce0TMueMKRZ4XJQYgCenRnt7JS30poywbGos6oSprJ13CNKhm9Ag=
X-Received: by 2002:a05:6000:4713:b0:488:8566:9986 with SMTP id ffacd0b85a97d-48e2d0ff5ddmr10532774f8f.2.1792751709131;
        Fri, 23 Oct 2026 03:35:09 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edef81sm4665234f8f.5.2026.10.23.03.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:35:08 -0700 (PDT)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH 00/16] Centralize the ownership of power rail votes
 for Qualcomm clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:35:03 +0200
Message-Id: <179275170360.4070168.15401690927522463377.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2455; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ib/lADe6pfUlXtQQRTg/Q6ldBcUGQ6EizR7YFWwG8S0=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm3LaKslnNIt9+eW5eVWGnBkLVM2WF645Ynpy6/Ti37q
 Cmld9qwo5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABM5ysPw3yPFaaeKL2ODTfM7
 2y2CDQfkp32sXXf4y0xfpxPLPxg2qjIyfO2Yq5Icx6SspT1v0g6hZtY2f8FY5fvTF0oU3Nu7dct
 CNgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> On Qualcomm SoCs, both the PLLs and other types of clocks alike require
> specific voltage rail levels to operate in-spec, but through the
> separation and decentralization of clock and voltage votes, these
> requirements are often not met and are never explicitly stated.
> This results in clocks being undervolted, or at the very least a state
> we're unable to reason about.
> 
> The devices consuming these clocks very rarely have their own
> requirements in that regard. (1)
> 
> This series moves the frequency-power_domain-perf_state mappings inside
> the clock drivers, ensuring a single, trusted source of truth is
> established and that the silicon is no longer driven at out-of-spec
> conditions.
> 
> To illustrate the nuances involved, here's a couple examples of hidden
> dependencies, as found on SM8650:
> * video_cc_mvs0_clk requires LOW_SVS to run at 900 MHz, but the
>   PLL it sources the signal from requires SVS (higher corner) to
>   produce that frequency. Similarly, to produce 1140 MHz, the clock
>   requires SVS, but the PLL then requires SVS_L1.
>   Analogous story for mvs1_clk.
> * gpu_cc_gmu_clk requires MX to be at SVS to output 625 MHz, the PLL
>   requires SVS_L1 to produce that frequency.
> * A number of camera clocks follow the same pattern.
> * Additionally, some clocks like cam_cc_cci_{0,1,2}_clk require
>   MMCX to run at LOW_SVS, but the PLL has the additional requirement
>   of keeping MXC (a wholly different rail) at SVS_L1.
> 
> There's a broad agreement that a consumer should only have to care
> about the clock it consumes, and that configuring its parents is the
> responsibility of the CCF. Requiring the consumers to care about the
> above cases (as is the expectation today) is a clear violation of
> that contract.

This is a fairly bold statement. Yes, the CCF's task is to make it as
easy as possible for a consumer to enable, disable and set the rate of
a clock, and I agree a consumer should not have to know what the
parents of its clock need.

That does not make the framework responsible for it. Taken that far,
the CCF would become a de facto platform coordinator, which it is not
meant to be. The clock driver knows what its clocks need; the framework
should give it the hooks to act at the right time, and stop there.

When coordination is needed across devices, there are dedicated
frameworks for it, like OPP and genpd.

-- 
Jerome

