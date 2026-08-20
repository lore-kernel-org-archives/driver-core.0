Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEAB442FCF
	for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787229478; cv=none; b=DywU8YYixKj2tLY2+hEpbJ8tLEPDY1KXceZ11rkyqp6pia0fY6pFydAReFXvunOntzyNdJrt+GVXtorilu0TTSDYmBRo6a5E+ozxh0l5uz41OhK34Gth8QiNbsoQG0mx0jHHkIrIwu7co9s8UCnrXYjzCb7YRVWzZl1zFFeTPx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787229478; c=relaxed/simple;
	bh=UCrvZDDTmo+QYnU7fvaZdmzgldTAAQxw6/JG7jwgwgc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=Fe7qfDxNj4vAALdjeph71gAokwpG6N2ONIdiKxhZqgoIq/SAcq6av28nFINlY2rakXw5JpTUljKBPqZfN8ozDK5IOfJblJLK0KrEiP4N0L14X788BjAjNvklBlMoqbfcDk9y8VpuYCRVfhMm6GMGUG3doeXzrJylbXS5+ebBUTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1qXJHmC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gAUDd/6n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1qXJHmC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gAUDd/6n"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6n8Ko3732028
	for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 12:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Ddo6WvT+kftbeXwJ9y5CABGvai4T6ssI5BD+OOeKAs=; b=V1qXJHmCb5in/+5v
	zqoxGVXSL75YTiAkwQj0vsLjAb00UEDNHVHklBOATRqrS7ZmNSDeGEo0NTce/nlA
	ib3nwJu1fx+Xvq/c/dlYaYwg8+fMzkfRSmr+Jxes9nMKiVQQVQ2vz8bhCr0yGENH
	zyAdQTADTwk1NzZQW2+n4znVv6rBIlc1EGgu7b02rNCn+kxMJBopthgRywUBYs1D
	2OMXlNUhK9HnkMbTNwg0hlVOodBhBJSL52DdLPsTQ81WaSHPvGqcayFOWFYwhi21
	Lt4QLNyl8z2SZJNpHZZctn8mX1gshEaWRdg6+NhXalwqWo4jiod8dbYzCgtiZXub
	cIctxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn899yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 12:37:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a098ea19so331582285a.1
        for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 05:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787229475; x=1787834275; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Ddo6WvT+kftbeXwJ9y5CABGvai4T6ssI5BD+OOeKAs=;
        b=gAUDd/6nGNGX3G/uxCYFlcyxp8TckKC1sVUOR2o1IzPwLIq4cI2etfXlA9Wu++AKTq
         wmCwn99wWLHerQ1cmz18vt9VWhsd2RTKO+q1M1wrgUNzuXurwoG8pMia75VxDzxxn3+G
         Lia79epBChE9d4uRayrbuutpTyEDre20Ax7lbgvNV2t7QquicHu5aa1ildqxZshg+MCk
         NCHU6Bio7KReoyMmGB32k7j5dpSJiPQ0Ap14QC7yxqtRuxgqJzKXPQkD/ZdKGVn6Fiz7
         enXezSCNXVPEfwVfpvMaD0kmJyy2398miH5TvSbVobIQNH2Fv43JupTr11zb6OB/byAp
         5IYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787229475; x=1787834275;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Ddo6WvT+kftbeXwJ9y5CABGvai4T6ssI5BD+OOeKAs=;
        b=W+FqZWGQ1pSkYlRupuuAHgUfW2ojjeFmbMQUOiqDmoMiTIJpyZ2kNqKPB4NY//CnLP
         IpEAXNylX+ivIEbnq9NmmJviU9hlHCioIeBSGYHHwlG0K/jysQDdDocEvQ5odscNDkAk
         LJya+deiT/PyALnD6aKORMa0b+CuV6mqCMW/zmJlf5c6mvrT9GgBQVMB+brErz0rQUVe
         dY9FkFYj7lSoLEilmpqUJuGzA1aBxUQRNDu53U8UT3yC/lXNaMNkyqcsMN5U4hhwxjCz
         O11I2Vsd9iM4pBwOnOKwxtkOwPzzp5krUDGhIgF+YLwcsmF8XHphphkJ3StCL/Hphv55
         U6qA==
X-Forwarded-Encrypted: i=1; AHgh+RqZvCYZMh8I7vW1PppEOvgYoKBwwp8WpLstZyDd3ewFDmO0fdAsQB+fPlY0niBZHsrv0WtCt/sVML+ung==@lists.linux.dev
X-Gm-Message-State: AOJu0YzC9EPJUNYH1EG09NgJ6FwhUj25vmulF3qpoZd+r9gpxevgBUkw
	JbmyUkKOupquiIJOax0KZmQ0seCg7GWMd4oGvm/+5aFFV2l6+1OoudZl5snBbPs+9TWoA3TlIpQ
	ShcShlgSgrKK7thtIQej6CTfVWSvszWYvC5h35Ee31G+SaeVP+BW6SNahfAoULnm3jg==
X-Gm-Gg: AR+sD11YcoSWpzo2Yjiybl4HcTtPlNEf0rgd7womQZZWYNFOHA7Vhias9bmQEGmMNtx
	S0QwXL1/hwSCidB0TYhmpI9BjaNd8ZoEOLOcZ/LarMZS+Ia37Ml/qIUAkTscYk/kZvhQmLXb8Re
	6maD+3WyMytOImNxpUd3PQE2HjUqTk/hgrGfWOFoJqyuCKpzpV4rD1H1W9yj0rg+epsIsRJ70b/
	qJf679JeM4Mb09s6c/yAj3XJYuQ6hVVw4GA30ZS4U9DcT59PcooaD9Dt5sDkk6SUyz7jFW8c0xn
	RUxE9Br1o63HclMDviOckrbsIdpf/e3+bkBZcv7PVMkI86iM1ZnK7mW3/iTvj1ScQ2JedeU6pyd
	d4Y8Xa33Qd9XlfmhV5pX99oxJ+4kGuEkVqRLNs01r+sGz3c2I7OYYFvShh9sVlJUz3CG95iQpaa
	bO250/c2zDNRsJbV8rhsEoFkPcCfFt0O02zV5q0TZS2P/ivGPmn8RH36pVJ+SyarpPUMk=
X-Received: by 2002:a05:620a:2b4d:b0:932:dc4d:c755 with SMTP id af79cd13be357-9371e30f089mr1239514085a.15.1787229474400;
        Thu, 20 Aug 2026 05:37:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4d:b0:932:dc4d:c755 with SMTP id af79cd13be357-9371e30f089mr1239506585a.15.1787229473734;
        Thu, 20 Aug 2026 05:37:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e2ab2sm63621366b.7.2026.08.20.05.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 05:37:52 -0700 (PDT)
Message-ID: <c461462f-de0b-43e8-ac9e-541013f5f8da@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 14:37:51 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] driver core: add device_schedule_reprobe()
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
 <08dc37c0d20896f5dc899a53c857935e91c6740f.1787185594.git.daniel@makrotopia.org>
Content-Language: en-US, nl
In-Reply-To: <08dc37c0d20896f5dc899a53c857935e91c6740f.1787185594.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5NCBTYWx0ZWRfX7cDiOl8a2JWe
 613X/8xYEvsxtSKSK9kjkUn6VF3ZTZFCabhmSM2LGfKF4svXYpsJTVmzcyroHxBljGDyheASFcD
 f31UqLhPRx5nWWvmlDJnLX2idzZhm5Yhdh0wv+hRBFZZ58zsUzLQ+w55yNAKKJvViW0K4MCXpcU
 XuPTtZhIZCpzNgTxNAZykc0SbuteAz4LZiNhgxC2KJ+QW+70c7MIo9LljFZHXtIXDecrsRjHXGr
 wFg1jU8jmkyvOhaPlAY2bIjJCSui4xVpXInOWjSWjycxGbYYHo8kzgE9UlvzQT8iqVPrAzjNFtn
 JUr3J8S1Nww4El2BIDdyUDut+7FxjagmIe5GDkhV/BSI9fc9l7tYgGlT3x8CSz5Xyb4nbH6UXxZ
 RZVX/NYMMgAw4tMfy/vIRDVAvPKLZZREp5IXjuEAdzC/csUaFPafdaNF83QZlX4IRJPbuPOp2RO
 hmwrf439xFgE2mMiamg==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a86f523 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VT4XjZGOAAAA:8
 a=EUspDBNiAAAA:8 a=hYbYuoZO4gQDBT1N23wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5NCBTYWx0ZWRfXzUspqAd9vtI3
 NQ9beEtbCjF1LoaV0gpoT1PmYU/ZnHXZ2QTB9E6Oqb7tvy4f0HZMpjCoIXoAeovyIxchTfWzGA0
 M+XT4i9TIuummOlTJu7ErysIR3A0fLM=
X-Proofpoint-ORIG-GUID: cx_gf_L-iPSR89OihJc7EMhloIm5QeNW
X-Proofpoint-GUID: cx_gf_L-iPSR89OihJc7EMhloIm5QeNW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200094

Hi Daniel,

On 20-Aug-26 02:32, Daniel Golle wrote:
> Three in-tree drivers schedule a deferred re-probe of their own device
> from a work item whose work function lives in module text: iwlwifi
> (iwl_trans_schedule_reprobe(), firmware crash recovery when a lighter
> restart is not sufficient), hci_h5 (h5_btrtl_resume(), RTL devices
> lose their firmware state over suspend) and btintel_pcie (synchronous
> device_reprobe() from its own reset work, with a hand-rolled locking
> contract spanning several comments).
> 
> Two bug classes affect the hand-rolled implementations:
> 
> 1. The work function ends with put_device(); kfree();
>    module_put(THIS_MODULE); in module text. After the atomic decrement
>    a concurrent rmmod can free the module text before the function
>    epilogue has finished executing. This is exactly the race
>    module_put_and_kthread_exit() exists to close for kthreads; there
>    is no work-item equivalent.
> 
> 2. There is no synchronization between the deferred device_reprobe()
>    and device_shutdown() or a driver unbind. The drivers do not check
>    any bound state before calling device_reprobe(), so a stale
>    re-probe can undo an administrative unbind, and the detach half can
>    run against a device whose ->shutdown() callback has already run.
>    The core already blocks the attach half during shutdown
>    (device_shutdown() calls device_block_probing() before any
>    callback, and really_probe() honors defer_all_probes), but nothing
>    blocks the detach half. For drivers which clear their drvdata in
>    ->shutdown() so that a subsequent ->remove() becomes a no-op this
>    escalates to use-after-free of driver state which other subsystem
>    structures still reference.
> 
> Both classes disappear when the driver core owns the deferred work.
> Add device_schedule_reprobe(), which schedules a detach and re-probe
> of a device after a caller-specified delay:
> 
> - The work function is builtin text, so callers do not need to hold a
>   module reference. If the driver module is unloaded before the work
>   runs, driver_unregister() has already unbound the device, the bound
>   driver no longer matches the driver recorded at scheduling time and
>   the work does nothing.
> 
> - The recorded driver pointer is only ever compared, never
>   dereferenced, so it may legitimately point to freed memory.
> 
> - The bound-state check and __device_release_driver() run under a
>   single __device_driver_lock() hold, the same lock dance
>   device_release_driver_internal() uses. This closes the
>   check-vs-detach TOCTOU that drivers cannot close themselves,
>   because device_reprobe() takes the device lock internally.
> 
> - Both @dev and its parent are pinned for the lifetime of the work.
>   __device_driver_lock() and the attach half lock the parent, and an
>   unregister of @dev drops @dev's reference to the parent, so without
>   a reference of our own the parent could be freed before the work
>   runs.
> 
> - A new shutdown_done flag in struct device_private, set under the
>   device lock once device_shutdown() reaches a device, suppresses the
>   detach half during shutdown. It occupies a spare bit in an existing
>   byte, mirroring how kill_device() sets the dead flag.
> 
> - The attach half is plain device_attach(), which already honors both
>   the dead flag and defer_all_probes: a re-probe landing during
>   system suspend detaches immediately and the probe is deferred until
>   device_restore_probing() at resume time. The detach half
>   deliberately does not check defer_all_probes so that a re-probe
>   scheduled before suspend is not silently dropped. The parent is
>   re-locked across device_attach() on buses that set
>   need_parent_lock, mirroring bus_rescan_devices_helper().
> 
> One pre-existing window remains: __device_release_driver()
> transiently drops the locks while consumer device links are busy, so
> for devices with busy consumers a ->shutdown() can still interleave
> in the middle of the release. That window exists identically for
> every unbind path in the kernel, sysfs unbind included, and is not
> made worse by this helper.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/base/base.h    |  5 +++
>  drivers/base/core.c    |  3 ++
>  drivers/base/dd.c      | 99 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/device.h |  2 +
>  4 files changed, 109 insertions(+)
> 
> diff --git a/drivers/base/base.h b/drivers/base/base.h
> index a5b7abc10ff0..6234e37de7e9 100644
> --- a/drivers/base/base.h
> +++ b/drivers/base/base.h
> @@ -106,6 +106,10 @@ struct driver_private {
>   * @dead: This device is currently either in the process of or has been
>   *	  removed from the system. Any asynchronous events scheduled for this
>   *	  device should exit without taking any action.
> + * @shutdown_done: Set once device_shutdown() has reached this device, under
> + *	  the device lock, before any shutdown callback runs. Read under the
> + *	  device lock. A deferred re-probe scheduled with
> + *	  device_schedule_reprobe() must not detach the device anymore.
>   *
>   * Nothing outside of the driver core should ever touch these fields.
>   */
> @@ -120,6 +124,7 @@ struct device_private {
>  	char *deferred_probe_reason;
>  	struct device *device;
>  	u8 dead:1;
> +	u8 shutdown_done:1;
>  };
>  #define to_device_private_parent(obj)	\
>  	container_of(obj, struct device_private, knode_parent)
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 4d026682944f..8a7dbe4e8362 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -4906,6 +4906,9 @@ void device_shutdown(void)
>  			device_lock(parent);
>  		device_lock(dev);
>  
> +		if (dev->p)
> +			dev->p->shutdown_done = true;
> +
>  		/* Don't allow any more runtime suspends */
>  		pm_runtime_get_noresume(dev);
>  		pm_runtime_barrier(dev);
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 60c005223844..3394b1c7ed18 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -1436,3 +1436,102 @@ void driver_detach(const struct device_driver *drv)
>  		put_device(dev);
>  	}
>  }
> +
> +struct device_reprobe {
> +	struct delayed_work work;
> +	struct device *dev;
> +	struct device *parent;
> +	const struct device_driver *drv;
> +};
> +
> +static void device_reprobe_work_fn(struct work_struct *work)
> +{
> +	struct device_reprobe *rp = container_of(work, struct device_reprobe,
> +						 work.work);
> +	struct device *dev = rp->dev;
> +	struct device *parent = rp->parent;
> +	bool detached = false;
> +
> +	__device_driver_lock(dev, parent);
> +	/*
> +	 * rp->drv is only ever compared, never dereferenced: the driver it
> +	 * points to may have been unregistered and freed by now.
> +	 */
> +	if (!dev->p->dead && !dev->p->shutdown_done &&
> +	    dev->driver && dev->driver == rp->drv) {
> +		__device_release_driver(dev, parent);
> +		detached = true;
> +	}
> +	__device_driver_unlock(dev, parent);
> +
> +	if (detached) {
> +		/*
> +		 * device_attach() must run with the parent locked on buses
> +		 * that require it, mirroring bus_rescan_devices_helper().
> +		 */
> +		if (parent && dev->bus->need_parent_lock)
> +			device_lock(parent);
> +		if (device_attach(dev) < 0)
> +			dev_err(dev, "re-probe failed, device left unbound\n");

Testing suspend/resume with a hci_h5 BT HCI which needs to be re-probed
at resume has shown that this may fail with -EPROBE_DEFER when run during
resume.

The probe does get successfully retried later and then everything works,
but this failure caused the dev_err() to log a spurious error.

So this should be switched to using dev_err_probe(), e.g.
squash in this:

--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1451,6 +1451,7 @@ static void device_reprobe_work_fn(struct work_struct *work)
 	struct device *dev = rp->dev;
 	struct device *parent = rp->parent;
 	bool detached = false;
+	int ret;
 
 	__device_driver_lock(dev, parent);
 	/*
@@ -1471,8 +1472,9 @@ static void device_reprobe_work_fn(struct work_struct *work)
 		 */
 		if (parent && dev->bus->need_parent_lock)
 			device_lock(parent);
-		if (device_attach(dev) < 0)
-			dev_err(dev, "re-probe failed, device left unbound\n");
+		ret = device_attach(dev);
+		if (ret < 0)
+			dev_err_probe(dev, ret, "re-probe failed, device left unbound\n");
 		if (parent && dev->bus->need_parent_lock)
 			device_unlock(parent);
 	}

With that fixed this looks good to me:

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans






> +		if (parent && dev->bus->need_parent_lock)
> +			device_unlock(parent);
> +	}
> +
> +	put_device(dev);
> +	put_device(parent);
> +	kfree(rp);
> +}
> +
> +/**
> + * device_schedule_reprobe - schedule a deferred detach and re-probe
> + * @dev: device to detach and re-probe
> + * @delay_ms: delay in milliseconds before the re-probe runs
> + *
> + * Schedule a detach and re-probe of @dev after @delay_ms milliseconds.
> + * The re-probe is skipped if, by the time the scheduled work runs, the
> + * device has been removed, the system shutdown sequence has reached the
> + * device, or @dev is no longer bound to the driver that was bound at
> + * scheduling time. In particular an administrative unbind is never
> + * undone by a stale re-probe.
> + *
> + * The work function is built-in text, so the bound driver may call this
> + * from its own code without holding a module reference. If the driver
> + * module is unloaded before the work runs, driver unregistration unbinds
> + * @dev first and the scheduled work does nothing.
> + *
> + * Multiple pending re-probes for the same device are individually safe;
> + * a caller that wants at most one pending re-probe must gate scheduling
> + * itself.
> + *
> + * May only be called from process context.
> + *
> + * Returns: 0 on success, -EINVAL if @dev is not a registered device
> + * bound to a driver, -ENOMEM on allocation failure.
> + */
> +int device_schedule_reprobe(struct device *dev, unsigned int delay_ms)
> +{
> +	struct device_reprobe *rp;
> +
> +	if (!dev->bus || !dev->p || !device_is_registered(dev))
> +		return -EINVAL;
> +	if (!dev->driver)
> +		return -EINVAL;
> +
> +	rp = kzalloc_obj(*rp);
> +	if (!rp)
> +		return -ENOMEM;
> +
> +	rp->dev = get_device(dev);
> +	/*
> +	 * Pin the parent too: the work locks it, and an unregister of @dev
> +	 * would otherwise drop the last reference before the work runs.
> +	 */
> +	rp->parent = get_device(dev->parent);
> +	rp->drv = READ_ONCE(dev->driver);
> +	INIT_DELAYED_WORK(&rp->work, device_reprobe_work_fn);
> +	queue_delayed_work(system_dfl_wq, &rp->work,
> +			   msecs_to_jiffies(delay_ms));
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(device_schedule_reprobe);
> diff --git a/include/linux/device.h b/include/linux/device.h
> index aee79fd6b32b..7a9916950577 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -1314,6 +1314,8 @@ int  __must_check device_attach(struct device *dev);
>  int __must_check driver_attach(const struct device_driver *drv);
>  void device_initial_probe(struct device *dev);
>  int __must_check device_reprobe(struct device *dev);
> +int __must_check device_schedule_reprobe(struct device *dev,
> +					 unsigned int delay_ms);
>  
>  bool device_is_bound(struct device *dev);
>  

