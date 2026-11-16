Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794854268;
	b=cuZlMDeQpaNEe172cL3scrc/VrNsRjpGWfJMuE+MN5LP2yjvmeW8unfkS2lQKrlwdVEg
	 qk1iae2qL09LPOCisZmjWVNfh/5fIp0VEvbPntjGe5v2Dxhc5gsf3NHdou3q/t4rH5JPP
	 nWKenkXZ5F27NW0wA4kINSzgdML6XaKhOgZBLayzVK4kfbt7WHapxPnc4lzqsRzgVXWQT
	 9wjdG4c/YrqAEmvz1LlYgs+MJXbg3GT4z2BogysgiLlq8FjC5HiCTSJjod8fkG0/yJWEa
	 bS1O1bpLH/eUDP/Q/Go2kAtFZsPdTUX3LdyZfGBkGi+pAV0RZ33Z7+4Hk4m5tsb6gag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854268;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ly0wSpOqETq67pj9QgQqaNP7QubSpXxkzzUxAFz3ui8=;
	b=ICSTACxYHIKkhaHYCThJ2VLPUQDncw9Oa+81bx3pH+kIlxX90dFPXvn7FAIYkUVQzl87
	 CXv5SrTEvd47N939YrmjYxjD5UFxwZd9EEDJtnQSQMPrFyg1G9ypKJFt/UoZl5qfi/V1J
	 QyzeLBCkseuIerMJYXDA56Ijk5xwDFCqDccl6Lg2cIElp0ZLylayRZ9pM4s+SMruPHICf
	 2P/fwb3tuAXF+DoVQnfvnt5NjRZkA+uGzrss/TLrCsE/7J93LufZzu4ebPmQDdpMH3Q1E
	 YsLBzBRzOwulHVsDGaftWjuLOMX7GtynLxWF2aqshRvbcQddyIW0ShlA1lYA1M+DUVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqT3NYpP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViP2ilN7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFC0606A32C
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 18:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AFC0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqT3NYpP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViP2ilN7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIFuU1110380
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 18:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ly0wSpOqETq67pj9QgQqaNP7QubSpXxkzzUxAFz3ui8=; b=OqT3NYpPMSWyNkoC
	T0jU1MWCwoayrXSsHrUPBONXfgqAYtHpimmXXc8u1ZVZdF548egHztbTNmT85olL
	2T/sThe5L7xH4V5dFkizBXkH0f32jZ1egUeaMGiHqXqS2zfgpiCopGrOmPm5Bz7r
	tlIWpaai/x4fvD0utZIEYuJVungkk8BPlrSPvchKJrplzwjYFkeoGUieZRQIBI9Q
	40KsMkT4PGroZwzOQZlbI58vK2HMhcQojkLzDr40iZ+GEP0h7oD6rmwAC2mfpGUq
	rtTuPNtRLW6i9e+1QoEzwxHF+XadsCGLPTluN0ttmkZGKyM/Oh1ZJvOKzvbEztlg
	l5hrWw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqgj0vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 18:37:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-948d83322f6so641993385a.1
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 10:37:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794854265; cv=none;
        d=google.com; s=arc-20260327;
        b=hr2x4vzPZXy+vK8/ks+1MkqCnozB6etBi+vCrVxl2ZHpCVIq/ZQObjM4pHJCGNSI/V
         /4REgTj95qbCQAJc/kR3peuHFduxSauRHoitv8W6sMM0mq4x/fygRvfNcnJT4g/bC8nV
         kk26gnDe4G/+0fX572oizwmd9OVgdQRv2OJREQOZ86htkCfvrGbNma+jnuoaoBuWL/eE
         KbfWGI/JTAs6g1SqQVN4gBGwpI83llUsNgIimlNlG1BTkjJwXK+fJrrk9UzGe3ajiK2N
         zFBnVHQuP2K/iFC5U8TnXY5trpQUVehKxMUxMkrBOQRUEtjTJdoDuDDnZeNDGJIvR/li
         cmzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ly0wSpOqETq67pj9QgQqaNP7QubSpXxkzzUxAFz3ui8=;
        fh=PpVGX6g+p2vqNDkyJibt/NsBpQTHwJ5qMKujSIE06c4=;
        b=V0hl0NTxOi+nilvUdcVfUIoGyhpimlM2wOvdcluhsBfRB0ZPDIVX3n/2RnHl9k2V4i
         Z2HuOEkTJ0lOGQCjLa1nDc2cVrJVRt4rTVUPj/pQoIVdvWehA0KCmca5ybvXjDI6Bd3C
         r2xk3AaS7thVKBIwXpoDz2Wd0moGvi54R1noYyQCXh5AWJ2EKoCi9TGKpwKlGEeT1sXp
         3JjkiKHZRuVOYXMH8cMTXDdpm/cM/pcRa7++FUk9H5DArSIz7nAtYarE1rlEgCB6cWNp
         bNfRBd9FC6ftmGiMJUMzibxqbBAmt6I9OELie+TbVqDEG0NTxt2uImNcXwblYrsRE1xn
         YfSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794854265; x=1795459065; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ly0wSpOqETq67pj9QgQqaNP7QubSpXxkzzUxAFz3ui8=;
        b=ViP2ilN7+zGyxDvPyT/A4J7xNEB2m56CpxZaS9icf22VCSsFw9NXjSU8j07PNXBcSo
         1rqag3YHH+c+rA2yIs28NqnUkV2A8kbn27WazEzU8h4QwYEhdPmvCDpLxeRaNhVBQ+RU
         hAnRXa9qJjRy197luCWynmSLvC6kyZEC06FiMomBO6fN7x/hceK8ia8E356+NWghFiHb
         eiq+OCQE9ZP3Z6bHpTbMEvJ35i5rjfHkTwUY6sX0WGxl3BKWvvNdF9nnOJBANFIT9Ox7
         RKXZvQZg9Xa0+9jpheWeYOZhyRUmFWJBoRULu4ryeNRygmu3ahCjSVs0ggWT3Y75SLUi
         Mcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854265; x=1795459065;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ly0wSpOqETq67pj9QgQqaNP7QubSpXxkzzUxAFz3ui8=;
        b=iJUX4V8cdaXODmwTYqKjnVR4mSTsaaEcKyZ3gyRDgSWPeWwAsJ6g8TiWuQhgvXHld9
         PGPCvUhRWEEOnLBRlrqBBk6/0rSvuUsa2dQeVZt/AExMnrpEKn6cF1CXAFhfyjFogJhf
         p73S0Xii2y8R8m8hPUdiy25sT8HKMVAlj9zATY4HGMnsER8Fuhl+M+O4ynUYZ4Roe3lZ
         0btBLSuTuBORaso7ncttIMbiDGKvppHn8UH85L+b75Tc05ItzKlyxIXjM72Oh8rSGuYQ
         6+mIM4/rFt6kmcrzcHJ6KT6fClYW+jhdpL7wMSmEchZn/dYUg7oRGa5O6A+1VerQ7ndO
         zu7g==
X-Forwarded-Encrypted: i=1; AL+hErHeZO8J6/j3BXiXfzUYpwCZp9GGZNGcDtrWx2kEI5WIMatEbNjz9YEl8fxvloLxyIYY4dpIQIVhuMUdAg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8CezxU6bkyGf2ozdJuwCnjNSXi8h+cKX5Z7mY9sUoEcsOOjvQ1
	hxpaIYEskPHNUBfx5SqiYjcOebu3JMfooSIMsXqsUE2k1Yif1EeyK0dpcahsUwDxv4yxNFfJzzK
	LkfHPe0pevsEsYt4VXyrcX1+kJl0L74ZEw10Jx7USzIdfka/GhuMUMK8kfmKOn8ZF4u8nlGyiNb
	tcI5UFv/AmTvTLF6Hsfp7yHDN/MavgFoDLbXpxq2BT
X-Gm-Gg: AYBFou0aqqeNYqDEg/s7Fmmdzm/6c8GSAEkC+Eu3BuJjN8Ml7+sGAB037qhDx61uM9f
	vI+lFZ63rfQIQ4XVLLRRLY+jaD5UUAJxpKmwoMUTZzMhEqUyQGGRq1N2iumBkPWNCgEs7EnrPwy
	QJkv3oAVAfKQpbgrc9HEmgGyX7bppzdXLYC29rhjfDRbmBtSMEL9jXMuu/Hx9f02Bpm1TejYmL+
	iAjaqJaeBnannsvjf/ytLxFgY1zM5atm83bUts1yvN51WIuYQ5dE/M3tWUQ7v2HG1FAYDesZAdR
X-Received: by 2002:a05:620a:6910:b0:949:6476:91df with SMTP id af79cd13be357-94964769908mr1306133885a.27.1794854265111;
        Mon, 16 Nov 2026 10:37:45 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:949:6476:91df with SMTP id
 af79cd13be357-94964769908mr1306128585a.27.1794854264515; Mon, 16 Nov 2026
 10:37:44 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102-pm-clk-resume-report-errors-v1-1-ba6e1dddd522@oss.qualcomm.com>
In-Reply-To: <20261102-pm-clk-resume-report-errors-v1-1-ba6e1dddd522@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 19:37:33 +0100
X-Gm-Features: AclHuK-5A642jlfrsRiFikZwKptRymZe-s-kt3fOZysrAU132IAw9jKbio5jyXg
Message-ID: <CAFEp6-3GKHmc4y_mTTVMO6iPdnpmxEmRokpki4uVGoBuXTj6Hg@mail.gmail.com>
Subject: Re: [PATCH] PM: clk: Report clock enable failures from pm_clk_resume()
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA3NCBTYWx0ZWRfX0y5eybE9sFZ6
 /tN+m919+uPePS75SjqVCqbpjiFdZ23FY8VWgAcoNwF91UxebyzZ3Q3WcsT4jT3FL6s1rOEmtiN
 7q9NPrSitjhSqDIaWNuRz31oTaF7FhM=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afb4d7a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=-LQT69PtjwrO-PJxn2MA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: NfJSXdYGkPABFKQw10yGePdaXque8d4F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA3NCBTYWx0ZWRfXyaBCi3c955By
 S0IY5T6yWsurqDG9ZdTR6w9zSbtcXkOL/n0I28wMIjFQ69zBAwhbCHHV8Ep9Ic/3+J7bTBUos/G
 Ga49yjlKbFCuzT5JTgv6y8dSl7JGB8Y6TRnfAZ0RN+l8Qz9MiUggkcNvq7NST8RpG+SFEPldb78
 GPrqg1E6iQV4EHWBF69v15Lthkx6T0X6mJaGsfVuGc5IUORmeOU/o5q+kDSEc9eDDPyhlP0xby6
 ABnJxzXl0xa+koGjPwTqmBWy3MBWrvGPge6JwhdsTqN3Pt/vs/vl+jFqnaPGXmuQyVrBDF8ANb5
 a+ckW7ysdQLOLUwgwVFFqKNc9fAKH9nm3iSE3dzQ2tpiiz8cBKnx0wytkQiChvIftA1aKK8qBQ1
 yUeq+9p/xo9GAnf+4NxubjDRnsX1glDniKRxGnC/J5mHdQdfigXAaSWhnN/Oz0jy7RIDauNZrzh
 N2ynu8Gxjd8Iokhmnhw==
X-Proofpoint-GUID: NfJSXdYGkPABFKQw10yGePdaXque8d4F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160074

On Mon, Nov 2, 2026 at 11:23=E2=80=AFAM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> pm_clk_resume() logs a clock that fails to start but always returns
> success, so the runtime resume of a device using the PM clock helpers
> succeeds without its clocks, and its driver goes on and accesses the
> hardware.
>
> This happens to the devices in the Qualcomm LPASS, whose clocks are
> provided by the ADSP: after the ADSP is gone, like right after a
> hibernation image is restored, a sound card opened by user space
> resumes the LPASS LPI pin controller without clocks, and the access to
> its registers then brings the whole machine down:
>
>   qcom-prm gprsvc:service:2:2: CMD timeout for [100100f] opcode
>   qcom-sm8550-lpass-lpi-pinctrl 6e80000.pinctrl: __pm_clk_enable: failed =
to enable clk 00000000b90a5151, error -110
>
> Stop at the first clock that fails to start, stop the ones started
> before it, and return the error, so that the resume fails and the
> device stays suspended with its clocks off.
>
> The callers of pm_clk_resume() check what it returns, including genpd
> and pm_clk_runtime_resume(), except the MMP2 audio clock controller,
> which keeps ignoring it. A device with a clock that fails to start no
> longer resumes though, even if it used to work without that clock.
>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> pm_clk_resume() always returns success, even when a clock fails to
> start, so a device using the PM clock helpers resumes without its clocks
> and its driver goes on accessing the hardware.
>
> I hit this on the Qualcomm Hamoa CRD while working on hibernation: the LP=
ASS
> devices get their clocks from the ADSP, and when the ADSP is gone, like
> right after a hibernation image is restored, a sound card opened by user
> space resumes the LPASS LPI pin controller without clocks and the whole
> machine resets on the first register access. With this patch, the
> resume fails, the open fails, and the machine stays up until the ADSP is
> restarted.
>
> The LPASS macro drivers already check what pm_clk_resume() returns, but
> never saw an error so far.
>
> Prepared with help from an LLM-based assistant.
> ---
>  drivers/base/power/clock_ops.c | 56 ++++++++++++++++++++++++++++++------=
------
>  1 file changed, 40 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_op=
s.c
> index 3b8ba27802a8..a978eb3d5479 100644
> --- a/drivers/base/power/clock_ops.c
> +++ b/drivers/base/power/clock_ops.c
> @@ -143,8 +143,10 @@ static void pm_clk_op_unlock(struct pm_subsys_data *=
psd, unsigned long *flags)
>   * __pm_clk_enable - Enable a clock, reporting any errors
>   * @dev: The device for the given clock
>   * @ce: PM clock entry corresponding to the clock.
> + *
> + * Return: 0 on success or the error from enabling the clock.
>   */
> -static inline void __pm_clk_enable(struct device *dev, struct pm_clock_e=
ntry *ce)
> +static inline int __pm_clk_enable(struct device *dev, struct pm_clock_en=
try *ce)
>  {
>         int ret;
>
> @@ -156,13 +158,29 @@ static inline void __pm_clk_enable(struct device *d=
ev, struct pm_clock_entry *ce
>                 ret =3D clk_enable(ce->clk);
>                 break;
>         default:
> -               return;
> +               return 0;
>         }
>         if (!ret)
>                 ce->status =3D PCE_STATUS_ENABLED;
>         else
>                 dev_err(dev, "%s: failed to enable clk %p, error %d\n",
>                         __func__, ce->clk, ret);
> +
> +       return ret;
> +}
> +
> +static inline void __pm_clk_disable(struct pm_clock_entry *ce)
> +{
> +       if (ce->status !=3D PCE_STATUS_ENABLED)
> +               return;
> +
> +       if (ce->enabled_when_prepared) {
> +               clk_disable_unprepare(ce->clk);
> +               ce->status =3D PCE_STATUS_ACQUIRED;
> +       } else {
> +               clk_disable(ce->clk);
> +               ce->status =3D PCE_STATUS_PREPARED;
> +       }
>  }
>
>  /**
> @@ -483,17 +501,8 @@ int pm_clk_suspend(struct device *dev)
>         if (ret)
>                 return ret;
>
> -       list_for_each_entry_reverse(ce, &psd->clock_list, node) {
> -               if (ce->status =3D=3D PCE_STATUS_ENABLED) {
> -                       if (ce->enabled_when_prepared) {
> -                               clk_disable_unprepare(ce->clk);
> -                               ce->status =3D PCE_STATUS_ACQUIRED;
> -                       } else {
> -                               clk_disable(ce->clk);
> -                               ce->status =3D PCE_STATUS_PREPARED;
> -                       }
> -               }
> -       }
> +       list_for_each_entry_reverse(ce, &psd->clock_list, node)
> +               __pm_clk_disable(ce);
>
>         pm_clk_op_unlock(psd, &flags);
>
> @@ -504,6 +513,9 @@ EXPORT_SYMBOL_GPL(pm_clk_suspend);
>  /**
>   * pm_clk_resume - Enable clocks in a device's PM clock list.
>   * @dev: Device to enable the clocks for.
> + *
> + * Return: 0 on success or a negative error code. If a clock fails to st=
art,
> + * the clocks started before it are stopped again.
>   */
>  int pm_clk_resume(struct device *dev)
>  {
> @@ -521,12 +533,24 @@ int pm_clk_resume(struct device *dev)
>         if (ret)
>                 return ret;
>
> -       list_for_each_entry(ce, &psd->clock_list, node)
> -               __pm_clk_enable(dev, ce);
> +       list_for_each_entry(ce, &psd->clock_list, node) {
> +               ret =3D __pm_clk_enable(dev, ce);
> +               if (ret)
> +                       break;
> +       }
> +
> +       /*
> +        * A device whose clocks are not running cannot be accessed. Do n=
ot
> +        * pretend it resumed, and leave its clocks off as it stays suspe=
nded.
> +        */
> +       if (ret) {
> +               list_for_each_entry_continue_reverse(ce, &psd->clock_list=
, node)
> +                       __pm_clk_disable(ce);
> +       }
>
>         pm_clk_op_unlock(psd, &flags);
>
> -       return 0;
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(pm_clk_resume);
>
>
> ---
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> change-id: 20261029-pm-clk-resume-report-errors-b5d538eb27de
>
> Best regards,
> --
>
> Abel
>
>
