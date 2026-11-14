Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794643089;
	b=RiJh96mJ1bDqhEsGdL81uzLDotI7OYfWcmB8zzYcVlfLR1IkwSPulzTV6d4SByQ2mhMb
	 YDQlR0TmbMGOUtSCsMc3eQaotOjifW3MBTQ3tL6YS7hXKIwwSxXtPa0PtLzbqqBJoRMUh
	 zMfrd0JbVxTmWD9FJdWnkqJWM1YSmy++wMFgg167u9XpRM0RCq3t1trAK09hLpBtHDp7q
	 pAnsRHtYPOlDrS7GmZV/frukDnotkJYHnPtlauCmsDJ2om6GDRf1eMhZAhUaicBUk4TAt
	 tcS4K27a+uPhzAzQLmmO9zsx5eLuMIGwl3k1dKSm4mVlCfM1snuUs/I54TyIe/7EBIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794643089;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NvR4HAZI4Lo8OnjwPJkf1d43cAiNZeVPyKEYxNFDU+E=;
	b=4uOC/da5hjP2w2oY7FYQRFNFrPKKktFwqV2qyAxyMSRKjDoeITVs5NnaWumm7WOsfHtb
	 sE/fZMm8mPMbvka6J6q/ewHRS477msEXGwQ2wDTAUfQcECi+Njl+a9SbD6j4Sig9rvgCO
	 Jnk3a49qv5Ea+w1NKLyp8bHyXCIjNXqrEObD14RINlTN0nS836PHCaHWUUbjV3OZ5obfh
	 ukiXrU1fdja8e0gOLLC3mzcgH59RHhR0ug7W/5SVIoNsFTza51gMsLPzcKqEMR8KDbQq9
	 8IUEPk2nsq2jLRGUgHpt9sJ8VOUjNZJKg8kSmSYRr1TwORIGHnm2O6YtfTFQwd8k9kQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mDbj3AGu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AxVyxRGm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD0A606A333
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FD0A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mDbj3AGu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AxVyxRGm
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE61E1R3882084
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NvR4HAZI4Lo8OnjwPJkf1d43cAiNZeVPyKEYxNFDU+E=; b=mDbj3AGu0zCqBixU
	ed6/Z9VsJsU/6V05b8gXxPGWdS+KOHeBjEEPVZ+rp95A8EJdnQXf6kqhqn2hH2Xo
	J79XEez7guii1GNtci361IDUFJKwRe5D3EKrZylXaKpxNegjecfFRuTbyF3jGxdj
	QS7s9M+ZxZejdwzwDvD2JFAtMaw1SeyjCTw5XcnT22fMNGC/HlHXg1ufB0OQDQ13
	GjlFPexOgwdPdeO8pf/1oaQcu1QrM8vOvVIXuSO9beR1C7uL/aua+TcjchX6P77H
	72VZAb0UXUZIsYmTN5X+d5Goce8XgR2XPK0IZrJOesLcmNzvgQ4XtWaC/nlxSFeQ
	e80VJA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmag89f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:58:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso2372756a91.0
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:58:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794643087; cv=none;
        d=google.com; s=arc-20260327;
        b=N3mWaR+bx5EA3v5PC0gGVYD0a4cCbLYfmwFe369cRj4xghxSS+r8vB/XGkexDUYPd3
         icQyx1263RoCobo9aS0rc8VINT0fXuuETbhJN/sKutZl20Gvgj8VV9eLgOUTUdsf0aZQ
         XqW6BGii8T51DxZ0dbKwdz1ZBqZnM/RUWc6BkJbAqh4bNP8yhsnuVTpXfGqGNXTUnJ19
         K8I64huIDJ5OKgpl7VdyBiCIhNmYnHb0o1ttRcyYTsV9h3XKu/FY6jjTQYv2LzYLYq8j
         OITJRoT8Hb5siWSUs/kAs/AAoEJZo91qMWv0pAJeAzMsjecZUW4TVNoXRPtTlCvjxo7d
         UK0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NvR4HAZI4Lo8OnjwPJkf1d43cAiNZeVPyKEYxNFDU+E=;
        fh=dF7cpX9gnlR6MfGGpc+M+n2duAgmu6jDCsX4DREGfyE=;
        b=S3/E87QCvKuuCk6QqWL4TqWYVK4eDg7fKrYp0hvtw7JadFJpXsnT1q5WoUeaQsSEJj
         xJKGRii1aT+IDokqjlykVbcqyjYJqWj+vE9KRO8qFa2/4EOxWajF8yPKXyy73omZLMVe
         NSkU+eoX8v8ZJml/QSAHo8u5DoFwcIPtXef7KN1Od9NlGeqX4/K6hyu8y6Ia5q2Z9Mfs
         igNROcsDrI3AB1X5A52NsMD6Ep2uT0iyR+/AV3cLJtHkGXyd2q17nzshNcoVImSGhCM5
         Fvl6A23Qih2wgn6sKQq/XPoVexemPnBM3QVsFIrn2/CNRm1wzDbW2ry9VHeZQF7MNPYU
         efqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794643087; x=1795247887; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NvR4HAZI4Lo8OnjwPJkf1d43cAiNZeVPyKEYxNFDU+E=;
        b=AxVyxRGmLwbKp7tRjLkwgW2hoy8C4CHSpA2tBI8efjuLTNmBqNb7+8PoVUn6Zk2tdf
         kTXxmz435EgpfvCXRzT4Sb9oAOSSDtweMznAp6txWvE7u8/GOyaau21ItoAjVpnUm5jZ
         ff7aoFIbsAaiAr52ByaebrQAI96xu9S/nww1/hjv8g5NYMn54kMuvef0M4UuJeQ48/8u
         pSj5IUz8FNioXZBfDVe491rRTCFFGskWT6VvdtL+W9Y3lm+R2OYbCLss+2VvcdAORXK1
         9p2DOWJ9KpLgPBToZMJ7qCtRR65HcMn1L7EWQ34eocJlLJWbRYWJKmXg4M4L97DagMrj
         Dl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794643087; x=1795247887;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NvR4HAZI4Lo8OnjwPJkf1d43cAiNZeVPyKEYxNFDU+E=;
        b=DB8It2o0gKUTMSH2c1O8jyJtNoQCLVww7cAC9jlt6vC8GHY2HBTbSWgyI3mcxxyJYE
         ML0UjiCNt4mfc44xN7wnzCA3QFmquz3ZzfsSdLj1K/Ufe9OKAakhw2t/wbpBgToOl57e
         k8DETawCv6vU+/AkKL2kZIyvgQ6vPUiAUyW8ZIPQC2JpaysnA3Ly8d9Dlv3MPvzZDyAZ
         lijhQGem4deoixo8GFTOIwUghRbaZ3WhcVmjbH0ACKS2UW5FilK9BltWQitZS29vkSmy
         zg/9fBl3u47DdjoJAF3IERuTNONb+Kt6ORfMGMKhSWfVllsVz4+CMdZX5bXuLZE4DEe2
         mxPQ==
X-Forwarded-Encrypted: i=1; AL+hErGw/wiWGWex6GfVCAs+eXqj493+f0jW90Ah6I6EWGMMkR/kOd6TkCDF2D+/tjf60sBD6eNS30OUZECQQQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z99GI94HtqfwCAq5css50qu6r2Gl6RdKwlkCn+dwWhnnLticNGx
	8VYMvm4HzMLrwMV8gSoHgyaQVRncP80AyaDSDipKnujSxwnf/KLesjL23kBbrVy69ORmdbefC40
	A/xctmtrbLLiwDeNvVLROKTxRWZW/Y+EPpuc4haFPE8Hqi2G+V6j3+pFOvrP6DciXI9BgMY1InE
	jbHYCpH2qcYMuaK0u3q4rGZMEzNK5GgCU46OzJow+H
X-Gm-Gg: AYBFou1V9gj1581gjWXmg8DNwUN0pxsAspM/rV+ad2odRu7rWdoygCiMvEK5P9qQU1T
	gUlWrLM0e6rsQQ+fAEcEB6QxfIVZxYjd7usxbvxZ/APD53QS+YJfeA66o0C3SJIbXCP23pe3Y/U
	vhelfxJkqmI0R6NH3psCSgHQSeO10MaDAQ73kjqcx26D9HBG9+OmQTk4Rbig==
X-Received: by 2002:a17:90b:3c8e:b0:3ac:9176:e83c with SMTP id 98e67ed59e1d1-3b1b09e5ee5mr4952052a91.12.1794643086750;
        Fri, 13 Nov 2026 23:58:06 -0800 (PST)
X-Received: by 2002:a17:90b:3c8e:b0:3ac:9176:e83c with SMTP id
 98e67ed59e1d1-3b1b09e5ee5mr4952038a91.12.1794643086266; Fri, 13 Nov 2026
 23:58:06 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <13032301.O9o76ZdvQC@rafael.j.wysocki>
In-Reply-To: <13032301.O9o76ZdvQC@rafael.j.wysocki>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 08:57:55 +0100
X-Gm-Features: AclHuK_pb1NVwWbh0QLiYOd4IdBJz6ttWXlwHm-S_h6PQMwai5uFseqDu76GcSM
Message-ID: <CAPx+jO-GAkn2Xw1i_foav6q+9UyS58MyBJ72CmsdP-9ry2CfOg@mail.gmail.com>
Subject: Re: [PATCH v1] PM: runtime: Update last_busy in rpm_resume() for
 active devices
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>,
        Brian Norris <briannorris@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Linux Driver Core Development <driver-core@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: M5U-T9F9cIp1hRae9UYzeR3EicIzF4Is
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAzMSBTYWx0ZWRfX/Fl4gTpR6VLI
 dE4PUXXR2JI7IIXC13CKXMkrz9ybsK/FG+B8SL06A/4pM4M2cv1pUhPUB+RyuxZe5vxK+af5lXu
 nO7ek5sfiHIZNcJmkzSsqWgVVK2TvgdozY1wxAk49/BEvo7Zhq9n6oTXU9WsWv1x/OHoAUH/euO
 bJLkRB6wnxph+DAu2gALP/crN8jVBSX5Y5Chv74p/DIUwYMOh6K6qPXIbCQ7KUJT/2eqKvCVmX7
 wIlnZzYMbu/AQVcHW6S5z1UbN545yetlb0qW6/wSd7hE8kuI1Omj9Bah6+eiaX5S3vfCdK7SAcS
 ew6Js3VH+qT8UJskB3+NgdVAzfWZmZwc/R4rT9KfRWlNMZKREMfE+GSpuSRnscmA4ci6W1xoM2V
 +WaBtrnL5HQhrxjkBGDM52ukBKGHCCeCzf9NGd45beZZr668Ydbiy710rNk891Zh/cHFvmVCZX/
 fD6bcKyv1Um2YaXzaUw==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af8148f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8
 a=cm27Pg_UAAAA:8 a=gZt39-j6hBPzH54buqsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: M5U-T9F9cIp1hRae9UYzeR3EicIzF4Is
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAzMSBTYWx0ZWRfX5L6kc1cg2hOA
 T/hlom16f8mGPljG6a7YcN5mkUDHH6ZNgTYPlo0hhugeMFGLVnit1ZaYK3ieHek3iC9XIPruUmd
 vh4bwPM51zwQoa66Xk9lh26poq9fX7A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140031

On Fri, Nov 6, 2026 at 12:31=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>
> Setting an autosuspend delay for a device can be expected to cause a
> runtime suspend of the device after calling, say, pm_runtime_put() to
> be deferred, so the time between the last successful attempt to resume
> the device and its subsequent suspend is at least equal to the
> autosuspend delay.
>
> However, that expectation is only met after the device has been actually
> resumed in rpm_resume() by invoking its runtime resume callback.  If the
> runtime PM status of the device is already "active" when rpm_resume()
> runs for it, the device's last_busy timestamp is not updated which may
> allow a subsequent pm_runtime_put() invocation (or similar) to suspend
> it right away.
>
> This is arguably inconsistent and confusing, so make rpm_resume() also
> update the device's last_busy timestamp when it finds that the device is
> already "active" and it is about to return 1 early.
>
> Fixes: 56f487c78015 ("PM / Runtime: Update last_busy in rpm_resume")
> Link: https://lore.kernel.org/linux-pm/CAJZ5v0jTX1FgeS9FCV=3D+V4uacSgLQBV=
sSPnU27ybgUGg57GUOA@mail.gmail.com/
> Reported-by: Brian Norris <briannorris@chromium.org>
> Cc: All applicable <stable@vger.kernel.org>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

I guess I may be too late, but in any case, this makes perfect sense to me!

Reviewed-by: Ulf Hansson <ulfh@kernel.org>

> ---
>  drivers/base/power/runtime.c |    6 ++++++
>  1 file changed, 6 insertions(+)
>
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -819,6 +819,12 @@ static int rpm_resume(struct device *dev
>                 pm_runtime_deactivate_timer(dev);
>
>         if (dev->power.runtime_status =3D=3D RPM_ACTIVE) {
> +               /*
> +                * The attempt to resume the device means that it is need=
ed for
> +                * something, so update its last_busy timestamp as in the=
 case
> +                * in which it actually resumes below.
> +                */
> +               pm_runtime_mark_last_busy(dev);
>                 retval =3D 1;
>                 goto out;
>         }
>
>
>
