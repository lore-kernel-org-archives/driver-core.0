Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795692797;
	b=NcbfmyfkRk5oTDp85pnmoF0G6Y1KImGMvSNONmqq6oXdRj9rR3K03F72dfIOC5n5jH6/
	 PBDyZOp5zhorXhWG4MBt9G9KDdbIO2jP8zsSLv5whu4mwEXs8sJqafcWWs78xdulsaR39
	 Q2w4uvG8Nv8T4cCZRrecqcV98mVp9I4DvTogOKcvx136ji1pe+qqX8ks8968HUp4eph8C
	 a7nasjghykWvWypgjQzYUc9fBR+TkVGL3v1HHkb8dodn79NvR0lDexd+bjhHDIK0PpUHX
	 iDzXcoPSYG1++f0/8txLiN/23VZvGn0lqLZ960aH6ObKngO57CFutnjDzCdlOtehuaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yzojCckQ+xllk0Py6ZM8C/6T/sfzNuCOCrHEJWMWxtE=;
	b=RBbgXJFRa0YMwdWnJyakuThlhCrVGv1FC5VW54NudNL4gMIFRr9sYUs+pluDlVoH5J3m
	 2G8jpuhMzRFtfbBK+C0hwcSCjb54pcCY0i9Tz7Wg+DVnG8CFhbi++/Wjd1xGqz3IYitVn
	 NYvzWluAl5nV1Rhh03BM9qVVmIrBB4r2WqOX4mA2gXyTBwl+ENE7vIktUxaDR6/v7pDrN
	 TeC7OL9ZkryAQiWgN+4L95RJNs0vdhckXqC+7/Lv2xjIqOzXy7jP6pLZxWZhpSZEWkrSG
	 OBaeKOAEfClSWo0hMtEn8PfDvym5MUoNdCy8llvwHjHm1439CBNJfnh+bYwyfFONJEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqVJGybq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DjNfKqyE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637B8606A338
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 11:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 637B8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqVJGybq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DjNfKqyE
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVUr94128748
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 11:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yzojCckQ+xllk0Py6ZM8C/6T/sfzNuCOCrHEJWMWxtE=; b=PqVJGybqKLFI6hDt
	VO4m5YKjtmV1AzjsX3B1Zbr9cjc5CS7Ow6DYPvnEVAzENBwwDXshzJQOcnhxuN/C
	KzwV50fP+KHiMsjc/KnSV2EupXcI1r2Ny+HFyPGaFUo5/EQOKfaU+Ks0E8Otugnv
	GOoz8Dx9RJ3u3yRwwJkuDKjRL5RK8FIo6hRq9kEVWl0OdbPl/fZZn6IfAepdbGry
	6X0s78HPuoUn04bPTlUTfXlgKCJJEKhC8MAzEAPn+PYva0FkeXZw2UjIxkapLyGD
	k7Vl/+z4d/VZdCKoU8GKPUlKQIG6vBI3jx4phqEcC8yATegHOf+X3Ogax/ckd1w/
	aS1L1Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vaur04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 11:33:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b42c3dba96so8011258a91.1
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 03:33:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795692794; cv=none;
        d=google.com; s=arc-20260327;
        b=D8CTTJnQCYWAZCAYGsPk1iMFYtfwylsqdq4J1whcrTYn7U3krTfyIJHS+YGN3Y34qO
         +qxFZ0KB8yw/GoMCBsmJ4DuXqz4JDaWKeqyYykbLPUTmPv6x3vQnzFnRRtxTWEHKapPB
         J99guZ43gvTjQfoeLo6SIC+Mo2SiwCYS9mDNW7owPChS8FUtCbSJvKD8q40pwFO0o2+a
         yzT7aLHwSWj8r69g7xkkeGKxjjaztotY/gDdgnS46MMJMz4Rf1SWVXsAK2PDRsCuNUl6
         KFooBaUl6ziLCpdY88cJ6iXfQCaEMqWw9tvJj35XBmCT4M9Zu9uC/uq3lntJmEHpzNid
         RYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yzojCckQ+xllk0Py6ZM8C/6T/sfzNuCOCrHEJWMWxtE=;
        fh=IkfIDZ514FFQ3ztxKyoA1smHaXoHWw8umAH+6D/Xmc8=;
        b=nDR/Q3+6Q4HVXqapz9kxnpuAkdoaiUNJ3E6ZbzppeuQvFCRPg1o+UBRDysNGoP3XAY
         K0yqY94OjGH6/PKkecbjV0T1xWzFE7Om9aCvib5NNOzjQTzqdzOljaOuG1DyX8XfVvxD
         wBaSTkyY3F8aYfir5/Dur+8H6Ei/SADcaSbJknAc+l0woMzVARvtk0dpsV4X48bQ/tY7
         89j5PcNnOAc13zBZIdmmbTXs3c4xCW1xrkfmlQ+5t04fBXNN7zhKEcHCR/ub//9/Fsup
         1SGFrEove3NdWGIGPA+UiblleNyBIFtBb+IGpu6q7Xu9AZ9KbkzF3ZK2vnSlsg48rcpY
         JIQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795692794; x=1796297594; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yzojCckQ+xllk0Py6ZM8C/6T/sfzNuCOCrHEJWMWxtE=;
        b=DjNfKqyE3j2pM3Fbu57FKnR3disCbM3eqZd4ON34sqg8k3pf6UlgVpDXHEKxCGgguV
         bLS5YlA0S/Cpqswr/my0QqJODoB0kj8JVE9U/WJe2WjR5mUG1C0wUKIfne8mn4cpX77h
         VEP3Za7a3g8YkvNEEye65W4ATLkIQ3eG3nfYeArrhUaDv7SsTvHfIqtBy6J3710GW/98
         u5vX8EApB4fIRFJSPdSZf0G3q+v23XliKK+tEGwAycNhA3y+MhQ3XgkrzKurPXVLK2OZ
         QGv5d51NidGZUOLDmbN9cf6dS/nar0px/TH8Kho3Aa4daG1l7ooIyp+/GAiR3PEgtRLp
         3QrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692794; x=1796297594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzojCckQ+xllk0Py6ZM8C/6T/sfzNuCOCrHEJWMWxtE=;
        b=XuKaifcmGgLA7MMD/ZENf85dGl8p9tSk28b5cktX7x6Khh4EZaaR0lkp7RfJ5JVvYp
         NwNVvAAScjM51R7iemfoIAVzHQqRamAM9d/ZjSiQ86LJgxbjdjsPo5ubLfkz7+2+KSmJ
         ajsvmVYqMkrl99mX6WKJlizBiZLwz3SmZpGE2Ot1VI/5fu2lbkwbJmC+012KyAfNcRdm
         JYtg2+ksaa0RShhWC8xg2sNkWoHWAoc0fyN7qtXsPyzF/S+qa8jKeGPRaQDr7VszWD7O
         nl+eXAtexxEXPAk99YFsqTulnOgrvh1Z71pslAVQhgItfKtf6NNuMDJUsJG2maPKmLp9
         LCOQ==
X-Forwarded-Encrypted: i=1; AL+hErFc6s1dfleRxg6/+YzAGo5EIDlglYHkg81fBc+3wGsDJ42V3s9R9RM3LjcnEOOjELMuq9Jnh8fdSrNLSA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8Eb5o3c9t2Y6uFwENh6j8/Rr/XCIpd+Xr2MhRNe11yjkWZhgLC
	RFzkX34XXtxxmxjKJsSaCqwWuiLJIulho8D7qfsg81cV/iL41em3Q4HwBBJNQGJJ6rvmQQ1tJn1
	eZMFY0dY92jOMPPh87KWRWzuPyBlzfESsRpIBkrhuj1xGgKSSw8oKsBFCSHeYhCSpdKZnKFgxRA
	cJDyZy84Hd3oAJfbsuTmqP+FhzehoUP52HSb4BVFYS
X-Gm-Gg: AZFdTZeXtuovetUSQr4q/OEnzqJNgPh+dX0+WfzVyQx1zDgTi7HapgKcfMPiRMg1H3a
	QfafWEilhAc3WkBIPrDnd20I0Dy5AEyOoa+XmYe20bW7CB5DHczylPvVYtSF/7rl5ZHCAoKcqFH
	6+M0OQ6SwQ4kmTLM4LM2OVDFYPyC4aGeZpCqoszJ28wvuYp/iVT/vBq5mo/A==
X-Received: by 2002:a17:90b:5287:b0:3b4:d22:8601 with SMTP id 98e67ed59e1d1-3b41c8fa9c8mr18812569a91.23.1795692794039;
        Thu, 26 Nov 2026 03:33:14 -0800 (PST)
X-Received: by 2002:a17:90b:5287:b0:3b4:d22:8601 with SMTP id
 98e67ed59e1d1-3b41c8fa9c8mr18812543a91.23.1795692793515; Thu, 26 Nov 2026
 03:33:13 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <13014755.O9o76ZdvQC@rafael.j.wysocki>
In-Reply-To: <13014755.O9o76ZdvQC@rafael.j.wysocki>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:33:02 +0100
X-Gm-Features: Aa3M54ph000dT0mgXrbi9kmWLblkGU9R39SHDDhIoTh294IoF-r8S4DLc94NZLc
Message-ID: <CAPx+jO-zXL2W1qnmbaCUNmTojNoUhymbZCXV8Lsw2jz-LT9vxw@mail.gmail.com>
Subject: Re: [PATCH v1] PM: runtime: Eliminate __pm_runtime_put_autosuspend()
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>,
        Linux Driver Core Development <driver-core@lists.linux.dev>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        Brian Norris <briannorris@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NCBTYWx0ZWRfX4OihRrZL6ErI
 rGzuWVlevpG1Vw5fY28p/epHpqdawfM+fFAshNMBoxKlSBnWu34dUnSdY5jXjBtCRxxF23avEls
 TUWpWWgfXVbxuY4GQSpHWbCPCXDMyOI=
X-Proofpoint-ORIG-GUID: vvsToVQ5ZkNNLO8vM-7Gb_owPQ4Qc6J8
X-Proofpoint-GUID: vvsToVQ5ZkNNLO8vM-7Gb_owPQ4Qc6J8
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b0818fb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=wRRl36yi_DWTeFIZz0kA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NCBTYWx0ZWRfX9f96gzGrRavj
 y7il1VqLBUyoQTY93kkRMSESB5vPIK8d69vEM/FRcPzjTEaA+CAkpsyH8IQWNKGDl6FUvkOaQba
 u32zGKXErvP2MZ+e/s0X6+WLYHHs+3lT0d+uEx9CTMiDLStUeCD9XIUfWhafhluHBzYeVDYKvPR
 Z4Dr0vrCKIDeqUUiHzbxMzz3jSxNHwdUqOakym0ShKdNhNgz7zT89LxiFXdf5wATMb9Nqocc4el
 gYCDnut37wVLUU4cPc9jKGo5y/y4wY14lGjJizj2xbERsxe3tHbr816ZCC5JYlIMqc/119U9A2q
 utEQsw0z50mGQOSC2b23ZIuezKiIBRw6qBxkmzDdngN27eMZIaPio7WB1+4UfQOVOpLA+3UHqLe
 numv2vlIr/kvd6+4JMNti+aqalIT+pTTBDS1i2VSLqPKlTS7+E+cCmoSMsJ76WZ0A9UL07h0sPI
 HCrEKLgFKkiUT2vB+bA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260044

On Tue, Nov 24, 2026 at 5:36=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>
> There are two users of __pm_runtime_put_autosuspend(),
> pm_runtime_put_autosuspend() and arm_smmu_rpm_put(), but
> the latter duplicates the code from the former.
>
> Fold __pm_runtime_put_autosuspend() into pm_runtime_put_autosuspend()
> and make arm_smmu_rpm_put() call the latter.
>
> No intentional functional impact.
>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Reviewed-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  Documentation/power/runtime_pm.rst    |    1 -
>  drivers/iommu/arm/arm-smmu/arm-smmu.c |    7 ++-----
>  include/linux/pm_runtime.h            |   26 +-------------------------
>  3 files changed, 3 insertions(+), 31 deletions(-)
>
> --- a/Documentation/power/runtime_pm.rst
> +++ b/Documentation/power/runtime_pm.rst
> @@ -338,7 +338,6 @@ It is safe to execute the following help
>  - pm_runtime_put_noidle()
>  - pm_runtime_put()
>  - pm_runtime_put_autosuspend()
> -- __pm_runtime_put_autosuspend()
>  - pm_runtime_enable()
>  - pm_suspend_ignore_children()
>  - pm_runtime_set_active()
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -79,11 +79,8 @@ static inline int arm_smmu_rpm_get(struc
>
>  static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>  {
> -       if (pm_runtime_enabled(smmu->dev)) {
> -               pm_runtime_mark_last_busy(smmu->dev);
> -               __pm_runtime_put_autosuspend(smmu->dev);
> -
> -       }
> +       if (pm_runtime_enabled(smmu->dev))
> +               pm_runtime_put_autosuspend(smmu->dev);
>  }
>
>  static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -588,30 +588,6 @@ static inline void pm_runtime_put(struct
>  }
>
>  /**
> - * __pm_runtime_put_autosuspend - Drop device usage counter and queue au=
tosuspend if 0.
> - * @dev: Target device.
> - *
> - * Decrement the runtime PM usage counter of @dev and if it turns out to=
 be
> - * equal to 0, queue up a work item for @dev like in pm_request_autosusp=
end().
> - *
> - * Return:
> - * * %1: Success. Usage counter dropped to zero, but device was already =
suspended.
> - * * %0: Success.
> - * * %-EINVAL: Runtime PM error.
> - * * %-EACCES: Runtime PM disabled.
> - * * %-EAGAIN: Runtime PM usage counter became non-zero or Runtime PM st=
atus
> - *   change ongoing.
> - * * %-EBUSY: Runtime PM child_count non-zero.
> - * * %-EPERM: Device PM QoS resume latency 0.
> - * * %-EINPROGRESS: Suspend already in progress.
> - * * %-ENOSYS: %CONFIG_PM not enabled.
> - */
> -static inline int __pm_runtime_put_autosuspend(struct device *dev)
> -{
> -       return __pm_runtime_suspend(dev, RPM_GET_PUT | RPM_ASYNC | RPM_AU=
TO);
> -}
> -
> -/**
>   * pm_runtime_put_autosuspend - Update the last access time, drop usage =
counter
>   * and request autosuspend.
>   * @dev: Target device.
> @@ -635,7 +611,7 @@ static inline int __pm_runtime_put_autos
>  static inline int pm_runtime_put_autosuspend(struct device *dev)
>  {
>         pm_runtime_mark_last_busy(dev);
> -       return __pm_runtime_put_autosuspend(dev);
> +       return __pm_runtime_suspend(dev, RPM_GET_PUT | RPM_ASYNC | RPM_AU=
TO);
>  }
>
>  DEFINE_GUARD(pm_runtime_noresume, struct device *,
>
>
>
