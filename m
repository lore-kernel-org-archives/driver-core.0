Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936A64457DE
	for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787230103; cv=none; b=P7xq62CdY5puY/KeCtcShElJnXvN4gUZnhVRXsmZMZx3GpPe1ZtQ7vqsK/7mk3yeEuGUarjWYRxvXN2wtdWRYziLRvUhV5jTTroI5BeVB9lm0/9TaLR8crM86YaHAu+qenTEWLqKHfWxltEa43iOzvnDtHe8PiYuof16wDgua/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787230103; c=relaxed/simple;
	bh=1rd0Xqdoh5avQQhT1vHHFyOkWivCJPvrHR0QlD3T3pQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=cL8Dnt9JOKxMJiAG/9omwJkLO6vbdujBIbxxZbcoq0Z9tsPYSddsR0lGc3nSWG9NVc+WZjxJQK1K53rt2M5eoxLdlor+pCQrFFUn9wVnY5D+4SuNlkll8WNNEyrXmoCCWfOkeGVaicD+BTcCNqy/GXYSUFh1X3KVa+sDKEGdqNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ep7YtsOA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZtAbTe2X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ep7YtsOA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZtAbTe2X"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA2hFa2932649
	for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 12:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cSJ2JZNIVR5js1sCoMJ57s5g+nh89AyHHTrFjEK1jx0=; b=ep7YtsOAA2Ltdb+t
	wVM6/yqu1UlC3yR7EvP66TsZ/61Wbdhg3D8lL8roUo2a2DrDnTPjppHH3oi26CKi
	VW5AfzFmTdcJl16Zkpf3FAnCOAiUSCWGoA4uCfSt/GDYnAhn7AgBM11OFsc7vs9p
	bNphRBf26D7RcfP+TcM3c4OqxgkIuP8pckEgQIOUUjzks97SBOUdUTyxzcOIygOb
	antgdUcgDnclP1NcFebJwVv+yxNX8EaN2UR6dSZS4qcXW2cf5aEtMA5ug+Kep3Fa
	ktPWh4zN+XELh2D5j6m0fOjaOt6LU8/jfWGBTpuJoRq+gc4Y0E5BLGZ+3u3jWE2s
	Y26L7g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg0gjv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 12:48:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494cce712so286118685a.3
        for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 05:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787230100; x=1787834900; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cSJ2JZNIVR5js1sCoMJ57s5g+nh89AyHHTrFjEK1jx0=;
        b=ZtAbTe2Xpr5S8BOAJA7HiHef1u44URZZS4B2QEEMgG5aXVKdfeMhXDfwxGgaRHnFY/
         tS+TLLzsKfHMShdUI6KE2YiEdutGeIuKRKRoXYEiapyDE0Dh1Da7J5NOKIoQcEdYTrJH
         yqFFnYyL+BEHM0sIa37kICcMU21jsFXJvG/gcQiFcRDjI1OL46wsIXICFkPvcp/iHRIq
         UEKc0Lbura9HvuEqvVByZ6fTjj0LKShXm3RptZ1PqhcTcbjo4ufKNop5X2/5Biy276FV
         Vp1FI3F39oeQsvnavh4pB4kA3XrE9f1EQ4swagYpYlkv7c7lmThJf1byoaZIjrt3JcEO
         95gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787230100; x=1787834900;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cSJ2JZNIVR5js1sCoMJ57s5g+nh89AyHHTrFjEK1jx0=;
        b=T/Ri3wz+4fJu5y8P80CUQ0nrQcLEm8pVpORbLceOqa6U4kudHYaIouDgaJY0+v8akV
         z0EpEPgW0SCE1wSVjPvR8/YsWpXf8QRs+SUrWIOFEjst7KaU31dpI3QutvED4/8qHK0f
         7zz4kvaXvzUH7DBCugPtRXkfJr7kde+9JKH0FDY5SEvUPzWE1AlNw2yV4DBI4M2IPlZQ
         UxQ8nPU0/nF3OlPkMx8rPrd3PGsvlXlCbWYYtqlwH4w6PhrCUDy/t1BBSeRlTo25fkDF
         ELk0cBnUGoOLNCTzsuOoF5MZ0qVWwV73jgZj60QxJB/yjDVlCdpPJRFokA9r1p+l7eW/
         En6A==
X-Forwarded-Encrypted: i=1; AHgh+Rrtqdvetn3qcmHgIVjw5P4DfzIv/BfCpahECmbMxx6mG438X/OUepEUfLAUSzwQ0pP7TNKAmacIrrsQNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YySuC50pcmXp75/nJdgIJgmGf4XCDx4MRSBQw7qJW5w8inJkyLS
	IpdhTMv2kuOFSc/2xNKqIA+My9noW60iDuANjdR4MtKuFF3b+sYNec/haSs3uxUKg2WZ8xiS0LY
	/6HrNceNUXeqm+9tGltiAQFtxARZMEgjdLKz421D/P7MhveXmyBDNnbdGaG31aJIibQ==
X-Gm-Gg: AR+sD13n3Meg6Yn91VXTycq9AplFtd23TQN4H9TQgDl0EftM0ZCVu0/TtfTuiTDdJaQ
	yL8m2DBKuKI4Mm3DFLxiF0nVtSielsgFk633M8UetwQDR+uN/L4HA8PgmE7FrU3UN35uX8LEP/A
	SxUd3Yv6FmStqLnELDOsPhv7zToI/i0fYy1ICPftJsrZa4Tj87N+Pjh6T+4NL/FCzTiR/344XHl
	P2D3k0/sUHu2ExIrbmpGUExb7VN8onm0TCPQBIksPrxc9v5jlgJdnQk+s8OM4VyzRDkOOkRMLtf
	+kFlJMN593k13QVDIIqDTk58N3gb0MHmNvfTY/2h1hH/1QvnPBxit/EPO54wE3IUMff+XK/emGa
	K+fnVyjwYr1lAJwISv1XhDjxlwHl6G+P01X5O6+52ovF2HwkOn1S+a1WBP8uYHzJVYKegg7/bvb
	IRvmRJLyboUPI4k6eIii2EACn3bqNQOHg3MXAVm+6FfoxjiHdgeKg1VwcNwhA4BUhGEnk=
X-Received: by 2002:a05:620a:4111:b0:936:9525:e952 with SMTP id af79cd13be357-9371e66fa14mr1064201585a.41.1787230099532;
        Thu, 20 Aug 2026 05:48:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4111:b0:936:9525:e952 with SMTP id af79cd13be357-9371e66fa14mr1064198385a.41.1787230098962;
        Thu, 20 Aug 2026 05:48:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b648f9sm62823466b.28.2026.08.20.05.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 05:48:18 -0700 (PDT)
Message-ID: <7ffe0c2e-0742-488a-ab6c-1dc2fabc049c@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 14:48:17 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] Bluetooth: hci_h5: use device_schedule_reprobe()
To: Daniel Golle <daniel@makrotopia.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Miri Korenblit <miriam.rachel.korenblit@intel.com>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org
References: <cover.1787185594.git.daniel@makrotopia.org>
 <607f76ae7cbfb5e04260f69634cbd276a1c1240a.1787185594.git.daniel@makrotopia.org>
Content-Language: en-US, nl
In-Reply-To: <607f76ae7cbfb5e04260f69634cbd276a1c1240a.1787185594.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KzQBwmOohimk0RxINw5BMPzH-VCJ8UTO
X-Proofpoint-ORIG-GUID: KzQBwmOohimk0RxINw5BMPzH-VCJ8UTO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5NSBTYWx0ZWRfXwe6flkbnbCLV
 RlIU3rscFgvzPSUhtiLV3p6aY8LlMgmvYNVeWh71L+jBUVsgwtAxWZ1bsM0UvztsC5xVyg3RdDA
 afb1Z6EIHskOSBf1V/0ddvUbm18WFoSN5Hdq7GDxyZEpJCehFlDsx7i9qHgVtha817dnE6ujYh1
 g0Il4g/vK8Y/bohZvZs8l6aEcb1GaYE285Jg6DIWY30hBpA3UrFTOunmw71tViaGDcyD6INmF1a
 zwEbYTxOF9yM6A3ZTsmoLOUvpHph+TfYhXCP29ULXVWJof4RyO78MDX21qOOQzc+OL0LEsBVkPZ
 TkAdh6zYpbA8Kx8LuRRuyqnpaWfr6iwcpk8O+JU80pJHmfHZ0b980kWLE05XJVHjRqI6ZJJjBpw
 nHm3CdU4KylRWXLnA0c+WEBO96GfGGP4exQ4bUBU2EgDCp/4u3mTORWD9BvGfohgsTAc3GDWNd+
 pEqeDZxAgGpAdPrRCVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5NSBTYWx0ZWRfX+9IvbfJBQ3/d
 7kvXe4jc4u8cK83vRzms7cwOS5nA1vXkeUBhqNOzDlPOt4Sb1fTtvMFHaA0ZR4XfXn0zRJ00E/P
 7iIerjs6gI2DP2jeZkdKLPd2QvwYecI=
X-Authority-Analysis: v=2.4 cv=JoXBas4C c=1 sm=1 tr=0 ts=6a86f794 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VT4XjZGOAAAA:8
 a=EUspDBNiAAAA:8 a=3ztaF3K77RXdcjtKaAIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200095

Hi,

On 20-Aug-26 02:32, Daniel Golle wrote:
> h5_btrtl_resume() open-codes a deferred re-probe for RTL devices that
> lose their firmware state over suspend: it takes a module reference,
> allocates a work item, and the work function calls device_reprobe()
> and then ends with put_device(); kfree(); module_put(THIS_MODULE); in
> module text. That final module_put() is racy: once the reference
> count is decremented a concurrent rmmod can free the module text
> before the work function's epilogue has finished executing. The work
> also does not synchronize against shutdown or unbind, so a stale
> re-probe could undo an administrative unbind or detach a device whose
> ->shutdown() callback has already run.
> 
> Convert to the new device_schedule_reprobe() helper, whose work
> function is builtin text and which skips the re-probe when the device
> was removed, shutdown reached it, or it is no longer bound to the
> driver that scheduled the re-probe.
> 
> The old worker suppressed its error message for -EPROBE_DEFER; the
> helper needs no equivalent because its attach half is
> device_attach(), which folds probe deferral into the deferred-probe
> machinery silently.
> 
> Behavioral changes:
> 
> - A pending re-probe no longer pins the module: rmmod with a re-probe
>   pending now succeeds immediately and the re-probe becomes a no-op,
>   instead of rmmod failing with EBUSY.
> 
> - A re-probe scheduled before a system shutdown or before an
>   administrative unbind no longer detaches and rebinds the device
>   afterwards.
> 
> - A re-probe racing the next suspend now detaches immediately while
>   the probe is deferred until the following resume by the
>   defer_all_probes machinery, instead of probing mid-suspend.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Thanks, this looks good to me and works as advertised on
a device where this code path gets hit:

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/bluetooth/hci_h5.c | 43 ++++++--------------------------------
>  1 file changed, 6 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
> index 93cdde981840..68eaa03a2005 100644
> --- a/drivers/bluetooth/hci_h5.c
> +++ b/drivers/bluetooth/hci_h5.c
> @@ -990,7 +990,7 @@ static int h5_btrtl_setup(struct h5 *h5)
>  static void h5_btrtl_open(struct h5 *h5)
>  {
>  	/*
> -	 * Since h5_btrtl_resume() does a device_reprobe() the suspend handling
> +	 * Since h5_btrtl_resume() schedules a device re-probe the suspend handling
>  	 * done by the hci_suspend_notifier is not necessary; it actually causes
>  	 * delays and a bunch of errors to get logged, so disable it.
>  	 */
> @@ -1047,46 +1047,15 @@ static int h5_btrtl_suspend(struct h5 *h5)
>  	return 0;
>  }
>  
> -struct h5_btrtl_reprobe {
> -	struct device *dev;
> -	struct work_struct work;
> -};
> -
> -static void h5_btrtl_reprobe_worker(struct work_struct *work)
> -{
> -	struct h5_btrtl_reprobe *reprobe =
> -		container_of(work, struct h5_btrtl_reprobe, work);
> -	int ret;
> -
> -	ret = device_reprobe(reprobe->dev);
> -	if (ret && ret != -EPROBE_DEFER)
> -		dev_err(reprobe->dev, "Reprobe error %d\n", ret);
> -
> -	put_device(reprobe->dev);
> -	kfree(reprobe);
> -	module_put(THIS_MODULE);
> -}
> -
>  static int h5_btrtl_resume(struct h5 *h5)
>  {
> -	if (test_bit(H5_WAKEUP_DISABLE, &h5->flags)) {
> -		struct h5_btrtl_reprobe *reprobe;
> -
> -		reprobe = kzalloc_obj(*reprobe);
> -		if (!reprobe)
> -			return -ENOMEM;
> -
> -		__module_get(THIS_MODULE);
> +	if (test_bit(H5_WAKEUP_DISABLE, &h5->flags))
> +		return device_schedule_reprobe(&h5->hu->serdev->dev, 0);
>  
> -		INIT_WORK(&reprobe->work, h5_btrtl_reprobe_worker);
> -		reprobe->dev = get_device(&h5->hu->serdev->dev);
> -		queue_work(system_long_wq, &reprobe->work);
> -	} else {
> -		gpiod_set_value_cansleep(h5->device_wake_gpio, 1);
> +	gpiod_set_value_cansleep(h5->device_wake_gpio, 1);
>  
> -		if (test_bit(H5_HW_FLOW_CONTROL, &h5->flags))
> -			serdev_device_set_flow_control(h5->hu->serdev, true);
> -	}
> +	if (test_bit(H5_HW_FLOW_CONTROL, &h5->flags))
> +		serdev_device_set_flow_control(h5->hu->serdev, true);
>  
>  	return 0;
>  }

