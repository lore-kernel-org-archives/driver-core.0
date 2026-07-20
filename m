Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15EA3E63AE
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542509; cv=none; b=BODW2b4cGa3ptzg0YFlna1SEEsXRRq5/rNLRHH23NTiZuM/+9F3hm+6eJdkua/+Uur8l5PgSfxFhOHL1Fmy5DF+x00icXL0dJ+wvhDLSRx83tpUtbpn1Tl15zuo76FAwOMC3LierG1MGxQotgbiVgEYJw5CRoMdq4hrrWfMM2Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542509; c=relaxed/simple;
	bh=cC/zmMj2BA27d70adCp6TV40MLwiZxOrTLBi3TyZkwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=npkyjTF0M8HNyziV+xanUo5s8brTs9bqCqQa8BfXhybPqTQGaBnI1XMEWHWN3/iNn3bYHne5buGVjxOLT48a7pNanHvVv9L8mQbrYuTxg2ui73sm4VibJxspJIMjd7O9eI9pqHs7XzqMnl6KgCDcp+C2Z8Rl1VoQzIVWU/4bTr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWl9FDtf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ug3lhEab; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWl9FDtf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ug3lhEab"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vfY92045727
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 10:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YzASZJAIi+nZyqX50kjG+5tMwFSD3jcN0yYc8R+sHoQ=; b=AWl9FDtf4RJfvsGB
	B6mMGlEfvfkSHq6Cl+zOJjAKBvI4RhtELriKuJbrET8doA+hDgBqPRAlsQ4NPTbu
	K0br4iwyMFC/lo60DOsrDmq9V9YyfiJK5V40oXj5rNExPWK/DNAQ5XF1l6KdDjmR
	xt/Yn6wugVy9hd+KHlIc11ibCH2OoXXEz2pZQ/5cTbs5L1vSMSA5bO+9aJTmkX7O
	aVg+wNy60ysq/Dez8ApklyY5O1GrCF4thpz0UbsRhexVneJwBRMMRt+p2relHPbX
	0EIKolYqFoEw4YY4Q4Mz7g9vawLiGGsf4ZS+LYYDxPw89UE5uem1UxtHYzbEJL5U
	lXi0PA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhggg8fsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 10:14:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0f0a0760so237615941cf.2
        for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 03:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784542498; x=1785147298; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YzASZJAIi+nZyqX50kjG+5tMwFSD3jcN0yYc8R+sHoQ=;
        b=Ug3lhEabq8Uo2LQequzqGmDHbsas6zY6vmbvid1ZzCmrn6TsgMMzjmgFnaY0Sx3mfa
         5ROfgG6D2Z6wG9X/vcrsWo5PnsywoFjlgamvkIfXQvnxfW8yAvJZslPr8/vhuGe1xI1a
         RZoSTTD3/CYSw4Rhi+rzR91uvogGaLShmyW50T9PgasMfgXL+L/RwzvGYPno5sc2UFNu
         0NO+boQT/fBk/eAoNaU+Mqc5yZIdsGwKy5YFn/44s+Tqp6pUCht/9gQNFXcTYBlIeeOw
         EBInEhwgbfBJ+EDPV2mESbVn63EhuRfWWTEv07Ne26CxUljs6hhNMCHZMwP74qWRY3yB
         2kFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542498; x=1785147298;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzASZJAIi+nZyqX50kjG+5tMwFSD3jcN0yYc8R+sHoQ=;
        b=kV5PE4OV85Pcr6nuLPeN1Klok2NUBNMjUlFIFHr1XTev12+vbe0b3aPmKEacrxNBIo
         sg8xbjuQzCh2aZOMtS08j/ecuNgek9LWQNc6bI3ezUZCO7q0K9mdCccdtGqINSdX576r
         f2mAkTYSNrUbm1A4hAicgKwsr+KI85jXvS7WI/VcPNWuUhHUG+1fEyknWh7ZHue/pxZM
         81ZbUMMDtOla5bq3p3095+7KMm+RKXt46OeoJLFz2o2GlPPGSiQAtHHNe8LORTLOrdxR
         5IIali7Dw6Wdw04kKqB4a+Jc6Ex0Pcqi/5MwWFtJyWxERy+n3K7TC36Ra6bmYoLdVYU9
         3X0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpJqL04w3BctkAzYY0Z2Fw0s8DY/x30JdJ2CG7D9m6M6BI1DJ+VoH+FAiGD9sxTL6xgrwIcbi6s8t4YIw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoLeF4apjukuinX2Iiou7vVum2fvB//SYH46XNz9fQZwkL//Iu
	HSXk4106etkxJwjBCSyyEBPVRJ8MeiHBX0DHZLKfQLdNSpG2ut+eraBoFMVXEIQeZIepBFwp/Kk
	p70LdJTgoKnxikZZanxnfccW4GgtjwoaxGBDpEbnUERrpoKmg33L3o5UI4KVJz9o4IA==
X-Gm-Gg: AfdE7cnYwEZKjIBhgShXnD3Q9aeSMZTIV8AzROasTsdIHKroTvmidNcMedsAbS+VYNo
	/JgaKJJN64zhiKCFPaORablUhW7JmucJuUWAmU3WBlFgFiuAoEKVvNg1t3rEHAJ9L2FJBXQB0eB
	1kzKB7M0a1XKeSCksIplBwzBxtUq7B0REE+aAhnI3wRs1Y/WtnuNa7NF/Fgr8ZqoBOgvH0pD3QY
	FEXNdOvONFlCpz0/mxMrujsx3ayb1o84iVVQxaU0ihIRvsMoHnRnJHSsway0Q0Q8EGh4d9PFmJJ
	q7oTmvH3HqTEBdikYu5hOShTnTZnQAz8YXDvkLnWhDVWwglo3UaEP1GQVxueD0g7YXSS8vPdXeW
	6G+fA9+NCajmDIxXYP6brmoorqrCS
X-Received: by 2002:ac8:5845:0:b0:51c:c67:2042 with SMTP id d75a77b69052e-5213e77d7a2mr130027681cf.53.1784542498145;
        Mon, 20 Jul 2026 03:14:58 -0700 (PDT)
X-Received: by 2002:ac8:5845:0:b0:51c:c67:2042 with SMTP id d75a77b69052e-5213e77d7a2mr130027431cf.53.1784542497790;
        Mon, 20 Jul 2026 03:14:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f6fa848fcsm18620675f8f.0.2026.07.20.03.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:14:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5] gpio: kunit: add test cases verifying swnode devlink support
Date: Mon, 20 Jul 2026 12:14:53 +0200
Message-ID: <178454248867.23896.4781577626735793708.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260720-swnode-fw-devlink-v5-1-ec250ae6af91@oss.qualcomm.com>
References: <20260720-swnode-fw-devlink-v5-1-ec250ae6af91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wJw-OJniLbGmhKByAhDMDawsNdNlZRMj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDExNCBTYWx0ZWRfXzjNAowA85iEE
 k0dqM6+jIwxDJuL7d3AiiAoAp4gnsfdAkTz3IZt6+Z/GOEf/chFbBYX0Jlyuc+KamzxKwVKmq88
 gGgoj8h9x8bmgWswNrajbKESe9JFKAhtP1V6I5msOaSCk+qijk2bdQJ5F4G9Q1M0GhEf2CswPEJ
 W2E+RfHKbAWLcef8urp/w+O7ymmTwjF7zjnq2s3CD2E9V0HfvvTB5z0G/N9jwpMDOhWTRk4oE58
 McI7B0ldJ39/bfWxsP/h4zcEpzo5XEhqf9A5EvNMtBXOqbCq2IntausH3VNqSy2FWBEbyZT7/BF
 yOYYamQVJKG1nzia2VVRjjLHoVUrw7M80sSzJpBm6hJRkHJcZ4+EoADvepFLgd9YyOpcXCq5aTZ
 +uGcPvzABWmNgT0V/0o5WXS3vjxsBwOwcmMixyDQzognNdjCb0tCri0drksjypmgj2MRHUSFm4+
 C+SNHkgfSvi85yjtSBw==
X-Authority-Analysis: v=2.4 cv=RPmD2Yi+ c=1 sm=1 tr=0 ts=6a5df522 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=N-8F-g_hktDZAXegwvoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: wJw-OJniLbGmhKByAhDMDawsNdNlZRMj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDExNCBTYWx0ZWRfX8jRHideO0Y9i
 +kiBXAjgldSsxL9wTwOx2y9+XqQeRe96Z5EbCN0sUIHnftDVwmaF0Yr6uejR4BDOVJpVhGuhTUm
 i5GXaP8EbgTFgI4WtJPb1pyYexzaQTM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200114


On Mon, 20 Jul 2026 10:15:31 +0200, Bartosz Golaszewski wrote:
> The software node fw_devlink support already has its own kunit suite, but
> that verifies the fwnode links in isolation. Add GPIO tests that prove
> the ordering works in a real-life use-case: a GPIO consumer that
> references its provider via a software node.
> 
> The first suite registers the provider's software node, adds the consumer
> device first and checks that fw_devlink defers its probe until the
> provider has been added and bound. The second covers the fallback:
> with the provider's software node not yet registered no supplier link is
> created, so the consumer probes, devm_gpiod_get() returns -EPROBE_DEFER
> and the consumer only binds once the provider shows up.
> 
> [...]

Applied, thanks!

[1/1] gpio: kunit: add test cases verifying swnode devlink support
      https://git.kernel.org/brgl/c/9672edf75bc7ba3fb5b7d529936548de38b5908e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
