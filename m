Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794861196;
	b=Z+okaJmGnYWSCT4/Mh9yXN1jcNqJ0bkPZ8SpeY+XHsUYBrjJZXfmLjzSNrGYsdw4+Lo+
	 yn1rP74U4ogPaDkIoHWJStvjLROaeH4chOxya27lV9/p0tz2EnKum9zGzjjQ4sjGxmQIV
	 UopjBKg5cYm3AhqnqywpQKKE07Od79136bqt+2txIWp8THFJM+Qcjax1m7JMBNAwTN6H8
	 blTUFpOgNiDmK2SBbK8sUfphE+IXm6u/vNIGXkwIIzSYqpmqNT3cl6hy2HgDiBKXtG3zg
	 uDpJCNXXXb9Sd0k45hw38crslaFu9vQT2Pnj/UUFkGkoyrxtXZ2nS1cN5lPcBLRGTfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861196;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y+SUElrzxvUX/tlMt9vFq6/5XavJz4wfY7YhEZN5OZE=;
	b=NzjbnHO5qE8mJ9p+2pbko4R49WtxIzHFHeImHNB3G3xRHeylIkrVphMIuHv/1mdoygFC
	 5f4cqzOvqjoaoCJLmOh7oFu9MMBrenGHzAkIjvSa9suQ6IEDmWNpchiHmIh3XCoC8ya+8
	 k/3apzo+jUb2IW2a2MK6SfFWn+iGXeqhSRVWOWtaQ30Kf6a4r3fzdoL7y9UqvdZAIw0z5
	 kkTZYl/HImKb9Sb3z5es4EPK85xdo8MdyIKnR9nA/FtFeGFlArLkM21R0xKF0E2H52WvD
	 Ikw14BpA7+Den7V5ky6Zel8WZhn72U12037mnzVgCbKHu8OJzP7uZi4s7OkjNRhSPGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="SkSD/q+f";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="PGPZ/Ww/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A8E606A323
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 20:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05A8E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SkSD/q+f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PGPZ/Ww/
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJfNfo2135064
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 20:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y+SUElrzxvUX/tlMt9vFq6/5XavJz4wfY7YhEZN5OZE=; b=SkSD/q+fupfJ4Ppw
	YRw6HQraaNMZjkAZ69W1OtzvlaXezRYxYZsCDMuPfUDIbsRytrO3YGWkenWQ03aM
	fatWX2ccU5R4eimHEDCSv8hpj65njnQibChz2M7ANvLJlzsg9kYwVRzSnux7aNUB
	mOpokAedWv3Wa8LGpSJQS2jsuulxjqvG9+pryw8BsUa4552n3H6b9NF9gZ6yfSDq
	/6rmJdHMe2nkstOw1XBn0AdRPPBDhiwPGEFcs+JeHLo142u0901OazFwERSaih6p
	iBwK5ixLc8x++NETpfUa3Tcdai2TKHssIZ5xYG657BomyQNT+sunB+0rZcAVJvo7
	5UFX0A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0003jcu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 20:33:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-945b0154705so261250985a.3
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 12:33:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794861193; cv=none;
        d=google.com; s=arc-20260327;
        b=K6vODpUNbqTS5Kf3lBokoeQRHBn4wxNVaWaudEbUfhEK+gisLrKBn3savlufaYRcSw
         xXc+TiJpXh8SaFW+tkLKADKhHnaGlurdOov+HePJpG7ugSuycJi4zcX8ODrlZRuNCgNx
         A6pdZo/fDkcTxtp/g9X78Q+7uqh7dgJGCfugyHrQqEJHTv90elx+VjcUWXfRfoYvo4f7
         mLHJzZ6tNIgSX+ExSylZyhpRM92qcPE+hlE8DQjnu3snwi3L2cB8yHN3PZ6g8TnXhEOS
         yYmj8+8sA4ehqgNC9M0ciDApMqFLu0maLnK6KHa5RAAHE96EDe1pMmlSpJuDD9v+P3P1
         6aGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y+SUElrzxvUX/tlMt9vFq6/5XavJz4wfY7YhEZN5OZE=;
        fh=OcD5AxON97d6ME41mQJI+uqEpoE+nkKauVVNnQErbH4=;
        b=LbVAVvF/54kyE4dX6gdjPjM9VgcHq2yW2C8DG/dw311HxP2Xm2PBCxhsLtQYNSOM58
         XYQYEH6jcDDINheKJfq7Q1mR3OG2LEazB30O+ohZCl6fa1vMxDhIxBMbyt4wp26Cw9fU
         y0zyVGSOiiDSm3HmuAeNNhdL36njO5MaH0R19CBHKnCIJAqlw1Rk9e5rfWOdZ9N4tPib
         Rs6wrzUIQIHBCDFuOZK02oqb8ld6rD9EQ/4gU5r8QiCyuqtQCMEJkAB8kpsr0sQk6r7L
         bq0RDrpT7Va7OnRRf4SoVRorJ7h1eikhIOBwqMbOi13WfWNvvKb3RagqeOOu4kK6JPy+
         DNDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794861193; x=1795465993; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+SUElrzxvUX/tlMt9vFq6/5XavJz4wfY7YhEZN5OZE=;
        b=PGPZ/Ww/9bKskh3WlukcD6H+/2w9aBa3EzJeMld4dLKnV+NO9LbxBkz9bhK7JdGaHL
         7oKlF+9ctlvK4X7EhP1DLUfzFvCtDb82mDpAtDNe7pZpjjsGbt8N6kX+iGDRWOBIx9TF
         cgHCX/OvZ+jnchS419HYVVsDyaoY3wbw3ZqPjjrfGOxzR7s5bkawtj+zdiYx+ggH/olk
         /yY+/oLNVZTrHqvgfNoBuv6NcC61g4GkkslaAJHuerFxlC72W57KE5FKhrmfMKndAMxB
         mWQnwHX06/6FatJCcW6zSZ2Hu0aNTaPUbbRaZnpbeLK6jsd0QbVv0kfYDghfrskKlzT/
         3K7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861193; x=1795465993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+SUElrzxvUX/tlMt9vFq6/5XavJz4wfY7YhEZN5OZE=;
        b=hxVEARobRrlO7jk5faBeif/VN268hp5H4nbf6HI5JrOP/OoWWMfPzbW7N47MIwOsaw
         Y4dzK+EDdswFo+16Zgnrcb6Pn1FdEG/Uz8dspZdWx8r2Vow+2BK20p21R7Yjtw0tKhaT
         rvHM66i08bfkEA6LUcUm+lP3qvKS7V22wALmzsxV8+g+POtqXaGbib4KVHZMeiUr1nva
         x/Vb8N2M8s/9bQQNPqNNLJldhL2jPmPc3gbIRG5YUOBHGbkvTrnNnw4KzbgN2MKkvXYk
         i2m7Lj3JXVsB0q9vYhvkfaI8t4I/FkYS/qMZGhnmOaVblwSqPN0yfPv3z5ghl+LyQCT7
         d01w==
X-Forwarded-Encrypted: i=1; AL+hErHx41lmdc9+/Py4yOfFr7VTmABiNkb+lWVcZ0NFurj/TwgCTJpkI318F7ihg1kzK81VQ6lRm6S+mwgdZA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8dvZExw53XvNLQ/fMZhOaBPuWJDCVs36+F+2uRiY6wSQqs9j/8
	rsqjAl9nzlxhODsaNn7HFxIYevZS7dnYipvXbsr6Ivgcl5WxxCSHZfNgxAkvTpLgS5y4+dXN5V4
	CacbinnQL5zISo2/UBEIWjx4W/C58NeBENv7te/FxPHoqwIQqyekWsBmwqzK/k3qtghgKKlf5k4
	HNuUnuF8ObK31t9r8PUmhGFssUK1LYzRps5iu+PYnF
X-Gm-Gg: AYBFou04EqwfJ1hMH0V/uAOxn0dK8VbMVjwF6FdJjsdQeniAPsFGGIFGfu5aj4r0jEq
	Yg9Z9YouOGIvZuMt7fDk/sFlpt7e8i/JrOwUQp4zmtDkJwvKP9yH3FvI4Eo0C5w9sKx5I1FNJWt
	ieZMA5dkWXYeL6jRSLBjTytfPQB1pHdKt8AUKl2R2r13twywUtugmrc7amPyJJLxOTEGUsM+rTI
	uJo7JDWJAWXOdgl+z6VQCKD956Ao9ulRLhuAmgK/ZQ3bnmnebVkWK5psxeSkIlXFjnrskitmrWl
X-Received: by 2002:a05:620a:2a06:b0:93e:b0c3:388d with SMTP id af79cd13be357-9494b9432demr1970460485a.11.1794861193204;
        Mon, 16 Nov 2026 12:33:13 -0800 (PST)
X-Received: by 2002:a05:620a:2a06:b0:93e:b0c3:388d with SMTP id
 af79cd13be357-9494b9432demr1970455785a.11.1794861192628; Mon, 16 Nov 2026
 12:33:12 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109051007.371843-1-daniel@quora.org>
In-Reply-To: <20261109051007.371843-1-daniel@quora.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 21:33:01 +0100
X-Gm-Features: AclHuK8LqAoYko6jfkEOWyP90pkG5Tye_Ye7sfmCxHmUMdYEwzinH0ptz0c_bbg
Message-ID: <CAFEp6-1zzzaHUL45qr-M+JdjL9rh2Bq5Nb3-GrHhv6kHrk2m2w@mail.gmail.com>
Subject: Re: [PATCH] PM: clk: Fix false-positive recursive PM clock mutex locking
To: Daniel J Blueman <daniel@quora.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: x1pnxfh5ulhVBAbcifYqpwAJIyLEXh8D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4MSBTYWx0ZWRfX+NMZ+/0/AF1h
 feCo2u35HGu83xNEMjGIXX0SgN+KWW/SJVocPoR5uJMCSmP6Ie+Lof2L04N5lhTaYYzC5ZwRBui
 PMQEX5I/C9tKYxpu6iX8EMQUpMLyF98=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4MSBTYWx0ZWRfXz0ruWda0M3Gc
 pT0jN4ErC/jexIHxdo0x+JKJ+5WBW4BlVhKVPSSQVCy6DPPlCItWWqt9PDIbiCE63B7XllSF483
 u49kLJHn/ksvA94tTd5sX1esFNLMbbPQ1yeSRcvk1pAbgPsNjrlAy4jqfNRj4vCQ/td2ZNK70Cn
 3R4bOyDKtCv7Fvi63L/JIM6GqON282fPsy+PtCErD/wqxO+xakiQM1uVBRraOhul+U0emzryuvn
 KJF/MODJx4oBXnKIt/3wO6m9jS0v5djTzeFiZ+gegkGQNwCZYtrNvAsxi+e/+98WWL3VICI055g
 8S57565zzcwR+aZt274x2v9LYD14NDkD6fip4lhShJHPrCz/JSe3m0YbHXw672LRyNxTykAKCIv
 zNyXwO+TQ0SKNLKbCv7S6L4MZMeNLBXIH6yeFAqu0rwlCRmayiTsFmMFbNRpHF/0huKYFDJkD/j
 /CBBV8aUvVOTYY4q6GQ==
X-Authority-Analysis: v=2.4 cv=Z4N5j3RA c=1 sm=1 tr=0 ts=6afb6889 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=t9ty7G3lAAAA:8 a=oDK9j7WA2MVx4Ty_S2oA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: x1pnxfh5ulhVBAbcifYqpwAJIyLEXh8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160081

On Mon, Nov 9, 2026 at 6:41=E2=80=AFAM Daniel J Blueman <daniel@quora.org> =
wrote:
>
> pm_clk_suspend() and pm_clk_resume() hold psd->clock_mutex across
> clk_prepare() and clk_unprepare() for sleeping clocks, with every instanc=
e
> sharing one lockdep class. If a PM clock is provided by a device that als=
o
> uses PM clocks, clk_prepare() resumes the provider, which takes its own
> clock mutex, triggering a lockdep report.
>
> This shows up on the Qualcomm X1 with the LPASS WSA/RX/TX macros and the
> varargs macro providing the "fsgen" clock:
>
>   WARNING: possible recursive locking detected
>   ...
>    pm_clk_resume
>    va_macro_runtime_resume [snd_soc_lpass_va_macro]
>    ...
>    clk_prepare
>    pm_clk_resume
>    wsa_macro_runtime_resume [snd_soc_lpass_wsa_macro]
>
> Lock ordering is always consumer -> provider, so this is false-positive,
> resulting in lockdep being turned off.
>
> Fix this by giving each pm_clk_create()/devm_pm_clk_create() call site it=
s
> own lock class.
>
> Scenario analysis and patch development was assisted by Claude Opus 5.5
> under my instruction; detection and validation was performed on my Lenovo
> Slim 7x with a X1E80100.
>
> Fixes: eb667d0fbdd3 ("ASoC: codecs: lpass-va-macro: Switch to PM clock fr=
amework for runtime PM")
> Signed-off-by: Daniel J Blueman <daniel@quora.org>

Assuming we agree that using separate lock classes is the right
approach here, and that using nested locking is not practical in this
case, then the overall solution looks reasonable to me. I only have a
few suggestions below:

> ---
>  drivers/base/power/clock_ops.c | 23 ++++++++++++++++-------
>  include/linux/pm_clock.h       | 19 +++++++++++++++++--
>  2 files changed, 33 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_op=
s.c
> index 3b8ba27802a8..94f2aa090ce1 100644
> --- a/drivers/base/power/clock_ops.c
> +++ b/drivers/base/power/clock_ops.c
> @@ -398,17 +398,26 @@ void pm_clk_init(struct device *dev)
>  EXPORT_SYMBOL_GPL(pm_clk_init);
>
>  /**
> - * pm_clk_create - Create and initialize a device's list of PM clocks.
> + * __pm_clk_create - Create and initialize a device's list of PM clocks.
>   * @dev: Device to create and initialize the list of PM clocks for.
> + * @key: Lockdep class key for the clock mutex.
>   *
>   * Allocate a struct pm_subsys_data object, initialize its lock and cloc=
k_list
>   * members and make the @dev's power.subsys_data field point to it.
>   */
> -int pm_clk_create(struct device *dev)
> +int __pm_clk_create(struct device *dev, struct lock_class_key *key)
>  {
> -       return dev_pm_get_subsys_data(dev);
> +       int ret;
> +
> +       ret =3D dev_pm_get_subsys_data(dev);
> +       if (ret)
> +               return ret;
> +
> +       lockdep_set_class_and_name(&dev_to_psd(dev)->clock_mutex, key,
> +                                  "&psd->clock_mutex");

You could simply use lockdep_set_class() and avoid introducing the
somewhat unusual &psd->clock_mutex name. If a custom name is desired,
something like "pm_clock_mutex" would be more descriptive.

It would also be helpful to add an inline comment explaining why a
per-call-site lock class is required here, and why the
consumer->provider locking order is guaranteed, since the whole
approach relies on that assumption to justify splitting the lock
classes.


> +       return 0;
>  }
> -EXPORT_SYMBOL_GPL(pm_clk_create);
> +EXPORT_SYMBOL_GPL(__pm_clk_create);
>
>  /**
>   * pm_clk_destroy - Destroy a device's list of power management clocks.
> @@ -451,17 +460,17 @@ static void pm_clk_destroy_action(void *data)
>         pm_clk_destroy(data);
>  }
>
> -int devm_pm_clk_create(struct device *dev)
> +int __devm_pm_clk_create(struct device *dev, struct lock_class_key *key)
>  {
>         int ret;
>
> -       ret =3D pm_clk_create(dev);
> +       ret =3D __pm_clk_create(dev, key);
>         if (ret)
>                 return ret;
>
>         return devm_add_action_or_reset(dev, pm_clk_destroy_action, dev);
>  }
> -EXPORT_SYMBOL_GPL(devm_pm_clk_create);
> +EXPORT_SYMBOL_GPL(__devm_pm_clk_create);
>
>  /**
>   * pm_clk_suspend - Disable clocks in a device's PM clock list.
> diff --git a/include/linux/pm_clock.h b/include/linux/pm_clock.h
> index c3b46fa358d3..d54681547f58 100644
> --- a/include/linux/pm_clock.h
> +++ b/include/linux/pm_clock.h
> @@ -37,7 +37,7 @@ static inline bool pm_clk_no_clocks(struct device *dev)
>  }
>
>  extern void pm_clk_init(struct device *dev);
> -extern int pm_clk_create(struct device *dev);
> +extern int __pm_clk_create(struct device *dev, struct lock_class_key *ke=
y);
>  extern void pm_clk_destroy(struct device *dev);
>  extern int pm_clk_add(struct device *dev, const char *con_id);
>  extern int pm_clk_add_clk(struct device *dev, struct clk *clk);
> @@ -45,7 +45,22 @@ extern int of_pm_clk_add_clks(struct device *dev);
>  extern void pm_clk_remove_clk(struct device *dev, struct clk *clk);
>  extern int pm_clk_suspend(struct device *dev);
>  extern int pm_clk_resume(struct device *dev);
> -extern int devm_pm_clk_create(struct device *dev);
> +extern int __devm_pm_clk_create(struct device *dev, struct lock_class_ke=
y *key);
> +
> +/* Per-call-site lockdep class, as clock mutexes of different devices ne=
st */
> +#define pm_clk_create(dev)                                             \
> +({                                                                     \
> +       static struct lock_class_key __key;                             \
> +                                                                       \
> +       __pm_clk_create(dev, &__key);                                   \
> +})
> +
> +#define devm_pm_clk_create(dev)                                         =
       \
> +({                                                                     \
> +       static struct lock_class_key __key;                             \
> +                                                                       \
> +       __devm_pm_clk_create(dev, &__key);                              \
> +})
>  #else
>  static inline bool pm_clk_no_clocks(struct device *dev)
>  {
> --
> 2.55.0
>
>
