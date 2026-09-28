Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92357199E89
	for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 23:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637864; cv=none; b=L+KnBK+836Z5QqkjQSHeD24sMaT1+er3iJ4lGpE5w+Q1xWbXNBVsv0YXovqZ+775qhaOuGm1Hx5pCfS0C8SozicvOg2QXuxcKGOtO/KHzcBdKOSkyNlGf5iPLLBEJugCr14ZsoOONbx2cDkuW1XPYTUWLpjOQrXtu/fnj+o+knc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637864; c=relaxed/simple;
	bh=HZ9EcX1lkWL+XWXcKS3X3cZj0rqlvavRCndufxDRODU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3O8YhdAdV3kqfHDoXTvoNB4VqwXq8+p5n1RtKlx4HQDNwMBrvAspgDMfi7HaAYRDWB21K5daUqh/hEiFJG8tuv18+ivZKkuocQXNP7m/v8Ymvpb2VdpLvT7WjE6LZj459qoNU+SMfUdCbkjN60oyXxs9COIJ+87Akxse21qEUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTQDzq6I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jVCxvSLI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTQDzq6I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jVCxvSLI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SLTHxN3764894
	for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 23:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XoyLUTFu/l3yoOpGw3lzvm9M
	jMkR2yyprPZj7j8euak=; b=cTQDzq6I4HSX4ZlHAeNmAhCMCdOj/sWlmJ7m1FL9
	eNWTMYNT15kB3c6fyTFITtUVfYylaXv3/vwHJ0s5izVAAfvlFCxeqvkUKscJ+B5M
	Nv3FWa9hd+hTqwhfOB1OZewjA78nzZUc8z21ljPsIOLAmfP5qZ2pW8NJjcDENs7w
	QaHSWzQvPF36T418WLedYkct63UBEk6VGSy3QGfz7dVujvQ1xH3ZcM/KMbmy2kOr
	zRrucUvqJF+g157DuiopDTpV13bZjL6GEsPu1s5MNihFFkc+26HBkZ/UJZgS99Lo
	Z8ZKBhcT0qdh0H21Sa/B0b5pbRXXH18n8PCQCJtWBrjfYA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyxmu8nyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 23:24:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30f1b904861so5164811eec.0
        for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 16:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790637862; x=1791242662; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XoyLUTFu/l3yoOpGw3lzvm9MjMkR2yyprPZj7j8euak=;
        b=jVCxvSLIf5ZFxqZu4Stsg4Iv2K9Ja8pi1HuoGfLSlNIZjy2NQW0mswU7AS2mK3YSsS
         2WUWiNCfugdAUxrH6YP/vJLxxgmDoX+LBIBCbo6kXHJPT9ttOj88yq7CjrPx9BNfE4cv
         TeFPpNvC90S89to1YnuWvJ6Pudxwf/tciMVo3YFH1MZSDg4fotWDQLEArGrsPaZnLqFc
         1SvgQ3qHC45Z/FiGXLRueONqU4aVBPvALO4uS+9Z9rN/y5RBBKlg3fMztJ9jNVIvQeJw
         4ilMVXkcT88ro6gW49M3czm5pTp3r3Dh3Oi8MAlWhuGY2FnJLKHxMTnN6SbkBLD8WUU0
         pdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637862; x=1791242662;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoyLUTFu/l3yoOpGw3lzvm9MjMkR2yyprPZj7j8euak=;
        b=GBdD56e7xfZ6xSosCjd4H04zuX/uCvvrXpaYf1k34XySg4ChPuCICcvdxaU5LYJVNA
         vJWX1yb/FumOy89jB0jKDSkeF0OssX3d1CQOKWreiVRyX9qEqggQkc8CY9cBmKcj+NTv
         H+OGMlHxrun3t7OYD5LDs3cGZOrNTf8GNJt2cWdzCunmaRWZNHwgE5YEbe5SiLlu7kpU
         cayi5lBdDzdSrSx9/BB2IfppFRyG6tiYrGYA7nI0OhpNPDj3M5nRv5Au91ORHNsw4pxz
         JZXFLZaTeUhSETOY0ugY1/NgX2jRJ62xrsy4+F9+9MdS9L+tn3n9Vl4uvu2o/wZTSe0G
         yrRQ==
X-Forwarded-Encrypted: i=1; AKwUvByVxB5Mu+K7EmH3IqLr0dBKqVPB2B1T2s+63s6EhPZKmeMZfL7LQ7HGT8VEq5ZzL3rXVPmdcICqYTkz8A==@lists.linux.dev
X-Gm-Message-State: AFuF++n+ORQ7pkUQiAju9IgJV2H5KrWMbZ1LQboFwMtT2YCrdkCNv7ss
	OJe/WEGeYQ0cR0uGlQKg9YYv+YXKVpIAIf3adub8vyu+aoZnmdGEyjCZt29bd6DSX2pB+w/GXp7
	t+eSKayFuslEn+xBxvoNs+VAbraDje+Ncv6WuLI0ROkSyK/bdaE6ezbz1omEN3p/vtw==
X-Gm-Gg: AYBFou123ZrXhFIrguBx4Cl/6U5v5i6zaGgD0dH7VMZ4DinvajSgM1mDlHkgRYiUG2g
	dsa7FMp9Gd/QjBLo0n6H7IR5/JqSABPvKqusFSO0TlSiB3snogGT3CvssY5RVlkVYeirhsT2hZE
	ofI8Nt/mLKgtY9EQecP6ejMmBfJ5bFowd6umoxkBa/F1tgG54O5YUVrYhBBKbPYtE01eU+c9sKh
	mw6A9I5DvbHdpB9XoEkqO9X0OOWD9EKYj+sdkCayCkvPsSAHsivNkK/h1CU3tAhOeIHjAzV0sZx
	7/QPHfC4zxEXtUaAo6SEQlRLBwRTOSow7hkP3S2azz4qwKmhOucFwPy/xsCUlN59ir/gRtijI0P
	iZax+/8bTuUowkEd32plqlGqiDRXh/oYsLZMAGNGuF2k6ZmwZ
X-Received: by 2002:a05:7300:a987:b0:33b:fc68:9790 with SMTP id 5a478bee46e88-34271a8dd5emr14957226eec.21.1790637861576;
        Mon, 28 Sep 2026 16:24:21 -0700 (PDT)
X-Received: by 2002:a05:7300:a987:b0:33b:fc68:9790 with SMTP id 5a478bee46e88-34271a8dd5emr14957189eec.21.1790637860989;
        Mon, 28 Sep 2026 16:24:20 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341459234a1sm30024130eec.24.2026.09.28.16.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:24:20 -0700 (PDT)
Date: Mon, 28 Sep 2026 16:24:18 -0700
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Robin Murphy <robin.murphy@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
        linux-watchdog@vger.kernel.org, Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [PATCH RFC 02/11] ACPI: Introduce irq_get() for static fwnodes
Message-ID: <arr3IhF0bwN4uzUP@hu-ashoraj-lv.qualcomm.com>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA5MyBTYWx0ZWRfX5tIXfYcWKDo5
 MuBJX3BTxmE+qTF0PueYRLPRP1JVGoABIgJS2zm8ijhLJtZ93o941FgUrhtQU27swnxFLSBtcwA
 HSPS9M3m8wvJwiXxhWOp1ED3WPUU0XJSE4RMSE7tMWpV9YJcyyBn+arGZmkE1Js8W8iPDyb6iWA
 UI96PUtbk7eGj7kytbFaXVXZq0z9bE7aV6gG/M/BBKxPg4WFxCUh+pg+KOEY+sEIM/FzTItZKcE
 +fZXt+xa4dtCC+Joggm7n2sDZ1bic94HK/b+0rtJKv4BwoSR4G9VlLhyTKW1X/tesL4qHxFSXWk
 15HkhZIVvFiGLfbuxotJTw6SA9Y/f+6S8YDSLsTmnFlIa3Vk00R5r8Mnjth26ZxazuZI+ikvwsL
 Lfeq/0P9x/glxTaNO01G8r6+TwG1VK+xnzgZRE0PBQjH5mFJE7FD2t5K8IaPOHQLQduPxm94a7T
 lOZ25qwGyGmyR2RZdLQ==
X-Proofpoint-GUID: 5hNu2g7R3A0gArSnn7hUJ4zjy4yOAPoY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA5MyBTYWx0ZWRfX+GT7XgGyGGDk
 NNca82PUdrUY/NSKU4/n5GOCJHQDVtKRQg19LtUiqHtPDHrVjxZDqoT4UXjjxCYiv7BIiPkXRY8
 z+43/xtHzFT/6PiuaHdzx9Hq89wRTPc=
X-Proofpoint-ORIG-GUID: 5hNu2g7R3A0gArSnn7hUJ4zjy4yOAPoY
X-Authority-Analysis: v=2.4 cv=c70+0h9l c=1 sm=1 tr=0 ts=6abaf726 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=MiKnSkdogZtXdNbqYk4A:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280093


On Fri, Sep 25, 2026 at 09:48:01AM +0200, Lorenzo Pieralisi wrote:
> To describe and map GSIs for firmware nodes created out of ACPI static
> table entries in a uniform way it is required to define some standard
> properties and attach them to ACPI static fwnode as secondary nodes.
> 
> Define properties names to describe GSIs and their trigger-mode/polarity,
> and implement an irq_get() callback for static fwnodes so that core code
> can retrieve and map IRQs for ACPI static fwnodes in standard manner.
> 
> An empty stub for property_read_string_array() is also added, so that
> the fwnode_irq_get_byname() interface falls back (through
> fwnode_property_read_string_array()) to the secondary
> fwnode to grab the "interrupt-names" property.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> ---
>  drivers/acpi/property.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  include/linux/acpi.h    |  4 +++
>  2 files changed, 72 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
> index 8ee5a1f0eb48..c609100c08db 100644
> --- a/drivers/acpi/property.c
> +++ b/drivers/acpi/property.c
> @@ -1766,7 +1766,74 @@ static int acpi_fwnode_irq_get(const struct fwnode_handle *fwnode,
>  
>  DECLARE_ACPI_FWNODE_OPS(acpi_device_fwnode_ops);
>  DECLARE_ACPI_FWNODE_OPS(acpi_data_fwnode_ops);
> -const struct fwnode_operations acpi_static_fwnode_ops;
> +
> +static int acpi_static_fwnode_read_u32_prop_index(const struct fwnode_handle *fwnode,
> +						  const char *propname,
> +						  unsigned int index, u32 *value)
> +{
> +	u32 *values;
> +	int ret, count;
> +
> +	count = fwnode_property_count_u32(fwnode, propname);
> +	if (count < 0)
> +		return count;
> +
> +	if (index >= count)
> +		return -ENOENT;
> +
> +	values = kcalloc(count, sizeof(*values), GFP_KERNEL);
> +	if (!values)
> +		return -ENOMEM;
> +
> +	ret = fwnode_property_read_u32_array(fwnode, propname, values, count);
> +	if (!ret)
> +		*value = values[index];
> +

You lookup with a propname, and then qualify with and index? is it
possible to have the different index but same propname? 

Alternately you can send the list to caller and they can use the ones
they need?


> +	kfree(values);
> +	return ret;
> +}
> +
> +static int acpi_static_fwnode_read_string_array(const struct fwnode_handle *fwnode,
> +						const char *propname,
> +						const char **val, size_t nval)
> +{
> +	/* Route string handling to secondary software nodes */
> +	return -EINVAL;
> +}
> +
> +static int acpi_static_fwnode_irq_get(const struct fwnode_handle *fwnode,
> +				      unsigned int index)
> +{
> +	u32 gsi, trigger, polarity;
> +	int ret;
> +
> +	if (!fwnode->secondary)
> +		return -ENODEV;
> +
> +	fwnode = fwnode->secondary;
> +
> +	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI,
> +						index, &gsi);
> +	if (ret)
> +		return ret == -ENOENT ? -ENXIO : ret;
> +
> +	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI_TRIGGER,
> +						index, &trigger);
> +	if (ret)
> +		return ret == -ENOENT ? -ENXIO : ret;
> +
> +	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI_POLARITY,
> +						index, &polarity);
> +	if (ret)
> +		return ret == -ENOENT ? -ENXIO : ret;

Consolidate return to one place? 


-- 
/ashok.raj
ashok.raj@oss.qualcomm.com
Qualcomm Inc
