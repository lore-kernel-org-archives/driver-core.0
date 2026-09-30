Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF9526A1AC
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 00:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790728691; cv=none; b=CvqF7D3LqjWKr1d1JNIMaz0K0+FCdAR1e2BSKeyJuzTPSwe5oDhz2xQ9J7kiXS3neVXjGFr4wOaGBs+PVHhl0RZFjQbpxWRdy+q8gdjd5D9h23IC3+qH+KjBtY+bOrSUnwHT6hrpUXf1cTaX/XbMAk4N6Djt07GNfc/O+svt5gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790728691; c=relaxed/simple;
	bh=lDQv8VNO6G/soX/VtU2MWJkebNPtrgeVeBYGPflNv8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/muKyFRZtWS+UeUR/w1e3ShoCJhNw0TWbQMfz2wFQoX5S49TQqoxgN9Hr4IOPSllM39IL43zKqavGqmIHwH8imzePF8ukIZZIBTblIWPEyLETEB1R7rIMLWL2K2PwxacN9dIA/MLzB5V6MWjoSiHjNsL06FGbQspVOqVzQH+lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a5CGJ63s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9+VPdH8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5CGJ63s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9+VPdH8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNPk9p2011478
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 00:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DihlMyvHEyVrVer9hDXtw89b
	IAPj1z5S1SGkXU3ZFzU=; b=a5CGJ63sjO8ovHEMsXAudd/im6jBlkmBPClNu3/A
	3DUskr40A0eTyQkOcUh/Qvn2KJ/9P8JF2DOHpoySV5rmce3213gAGsfFPfYctJqN
	ck8RXSvaGxPSc88VpB/6g6v4xePBeD7hqrslAwaXG8HyW0f9kscfOK+fO3Cnp0il
	iw1LBbaH09sPHRJhBqkQWIIX2rV/IouRt0JHAew80kEHFeEhsRpPv8nl2MY2qJvB
	I2RYLgM8BJ4D7EFq+ryaNsHt/jzGuOEI3jmHote/9Wue4mVPlC8nD43zVNfm6c8M
	jFQW/g9La5zqpIVvFL2sP5Alm1lxkKdHgrSvXSL1xvI8Cg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j0ehf36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 00:38:08 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so1342121c88.1
        for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 17:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790728688; x=1791333488; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DihlMyvHEyVrVer9hDXtw89bIAPj1z5S1SGkXU3ZFzU=;
        b=e9+VPdH8G/emzCSb3sFSdqJMKSiNMLSIulUtHfBSmEYrsIDyQpOdbuRZN5mTade3/N
         Bxeo0lscyLWBCPdH3X7V21Fkf4E8W1nxe8VOwIpuOwjqcyG5ZGprCbURP/YCvPqHyy2V
         G1eqHvpqZBpEdYyibOp4dn+jd1T0hFYL1l0t5kIJkOLBwC4Jl7qKceL6npy9uH2oIWTE
         Uk81WkFWAg3NxaYyYEeLXDUJHEKk+VoVQSBp8i0vJ3oFkkBbXSpJssXzMz/UsUCA1sQr
         97fp7giRXk6AbZBX6aHeokdso0GIk78ml4/SogXwyTrgnhn/L3+EWSvUwCaH/pZuZ4L/
         rFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790728688; x=1791333488;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DihlMyvHEyVrVer9hDXtw89bIAPj1z5S1SGkXU3ZFzU=;
        b=uUonEYfSGoP4jrnx9PISMnbG6i6t1GJ9nT51LBGEmLiDFadj4P7tL3bUo6zws0JuBe
         yzAP27dfOt3hs0hSZaSif50UYUIsBbU/msBgVLGdofxRWQvoAo/ZzVm+BRkC8UMePiR8
         9MhdZpS1Z5OSRhdBI9b5EU4OVmmcfr1MCEwFBzsGhNfCuv5E7Ea3Y1gPDP8VjaHojSWO
         3g0BhOwuH5xbAWRWhAUHL7rkTN0QiFNQ6HliHyCHTYBEjggGt0GjjSx0fjaZBsIjHwjb
         XqO6Q+ANOcZACiZT+fhkXoeIQPZn8q1rVK2kTzamwrNUiSPTeNlmHc7YNUf/LOigShx/
         3V1A==
X-Forwarded-Encrypted: i=1; AKwUvBw83VGF+IeJBGqm4SZeH7vaYbUVSZBGSbi3YQSNz+eqTVojmw7lVmgHMYAuh4SLvm1J46zYrjSxdUA+gw==@lists.linux.dev
X-Gm-Message-State: AFuF++lIABwGf8chdPFWfKomeUup9DkHa5doSrVZsM8mLG9kDMXLS/SP
	85nidRFAMxaQn5S+CmVpWJyLSPttnZl7gEODZ3zhszAMPfNOmdJ15oEEUiFYQiZZRD5qH3H+BOu
	UpY+Hmx4J3aLXysPOfzueh8NzHXi4xBnbVmogJmI6bS2+DcI1HKluUNkvW72pcUo5JA==
X-Gm-Gg: AYBFou1T4+BQApCa/lTd57IvFRcTLZLXk+D1XCYr3ub0toV1dOy+e9mqh4oJlQEoeKR
	Fdjb2AIiXB0MVwvDKRlhKcvwutG70ndd9ZNtU5A6+ut7Ixp4Oxu8qmEhp0j1o7PCTCjaBK2TJoi
	zzgHGrBjmqkf74UVPQML0lPJ9ItARJXf2eDK9idR+yPkYBl5RpOI8SzElHHH4IwtlaUmp7vnUZT
	wbdO1ShLE+ChxMOelZgu0MYyjxTv/6OV21byAf4v8AbBFb/X0Sk59Kf4A4MUBPwvFpV+k4NnrgF
	HsOKAzs6YPYI8UrFkgiG44F4vj+xZyLHpSBZp9RMZ5g5nDRIIheiqD6AhXWVyq3qpA+LfNpH8YM
	NeY1K3NvjTYNUHo8RVsmyBg2ZmObUXcO2R1yRpg0nvYcnrVSd
X-Received: by 2002:a05:7022:f401:b0:143:868a:20c1 with SMTP id a92af1059eb24-14ca00a17c2mr1398058c88.46.1790728687791;
        Tue, 29 Sep 2026 17:38:07 -0700 (PDT)
X-Received: by 2002:a05:7022:f401:b0:143:868a:20c1 with SMTP id a92af1059eb24-14ca00a17c2mr1397989c88.46.1790728686996;
        Tue, 29 Sep 2026 17:38:06 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c60c55d41sm1917754c88.1.2026.09.29.17.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:38:06 -0700 (PDT)
Date: Tue, 29 Sep 2026 17:38:04 -0700
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
Message-ID: <arxZ7BAya5ntRi6t@hu-ashoraj-lv.qualcomm.com>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
 <arr3IhF0bwN4uzUP@hu-ashoraj-lv.qualcomm.com>
 <art5m5QPXAOAvkvW@red-moon>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <art5m5QPXAOAvkvW@red-moon>
X-Authority-Analysis: v=2.4 cv=cqgOAF4i c=1 sm=1 tr=0 ts=6abc59f0 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=p-kz3MFidYKym44KqwAA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: 2sJifuZPUshWtNdd3Oh_EG8CXOF0qHfz
X-Proofpoint-ORIG-GUID: 2sJifuZPUshWtNdd3Oh_EG8CXOF0qHfz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAwMSBTYWx0ZWRfX3q0cog3zt5ns
 wD4W7gMa/b8rXhR75i8+396oS4xcJRpCLSLXX53maarjnubyfBe3uyyUYzURKK1f+8NTFiaBT3w
 AI+9d4Q2JEp5q6kmB2Ph4b9HjXGsjh4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAwMSBTYWx0ZWRfX28qkTdar+7sH
 0P7dFbJkQTUvtAfJJrRD5X8sQJv63B9WsExXBX09vMKwuTwVI3s2q8qwWfaFI/lAaswdfINH0uu
 edIWyWBmaWENuQLKO0RfugI3IbzxhVKmktsQmCfUegkiBc6OG+YVyK470aadN9PxYnwxknsOSzI
 o9LH+Z8sM82jDoA9eKnQcsEInIX/g98okojYPaLpm5qpjMIdYQtiaOZIGr/+XIOv9XFYxqJhJA8
 +9z61J0jh6kJ+6dHeWgMf5ZKF98fl9u4ZjxwQjH6OaYS5lTMONOVLr68ccQKF6CDKsnV+GNNg6b
 GknDrx40z6DMFfXb3DF+KZQ6A3PfjGlXOB/eD1Kjh/sXxvu4qGjsEn/JZu2TSkGM4gKUEocgcVE
 NVxIQJ2IzOXKb7mxlabRfvhNROQiICJAG1ZijLX6CErxC0yDYfZS1IuixysAu2eCP62oy6cjlxJ
 +DMh4cA80TlmYoyr3tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300001

On Tue, Sep 29, 2026 at 10:40:59AM +0200, Lorenzo Pieralisi wrote:
> On Mon, Sep 28, 2026 at 04:24:18PM -0700, Ashok Raj wrote:
> > 
> > On Fri, Sep 25, 2026 at 09:48:01AM +0200, Lorenzo Pieralisi wrote:
> > > To describe and map GSIs for firmware nodes created out of ACPI static
> > > table entries in a uniform way it is required to define some standard
> > > properties and attach them to ACPI static fwnode as secondary nodes.
> > > 
> > > Define properties names to describe GSIs and their trigger-mode/polarity,
> > > and implement an irq_get() callback for static fwnodes so that core code
> > > can retrieve and map IRQs for ACPI static fwnodes in standard manner.
> > > 
> > > An empty stub for property_read_string_array() is also added, so that
> > > the fwnode_irq_get_byname() interface falls back (through
> > > fwnode_property_read_string_array()) to the secondary
> > > fwnode to grab the "interrupt-names" property.
> > > 
> > > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > > Cc: Bartosz Golaszewski <brgl@kernel.org>
> > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > > ---
> > >  drivers/acpi/property.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++-
> > >  include/linux/acpi.h    |  4 +++
> > >  2 files changed, 72 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
> > > index 8ee5a1f0eb48..c609100c08db 100644
> > > --- a/drivers/acpi/property.c
> > > +++ b/drivers/acpi/property.c
> > > @@ -1766,7 +1766,74 @@ static int acpi_fwnode_irq_get(const struct fwnode_handle *fwnode,
> > >  
> > >  DECLARE_ACPI_FWNODE_OPS(acpi_device_fwnode_ops);
> > >  DECLARE_ACPI_FWNODE_OPS(acpi_data_fwnode_ops);
> > > -const struct fwnode_operations acpi_static_fwnode_ops;
> > > +
> > > +static int acpi_static_fwnode_read_u32_prop_index(const struct fwnode_handle *fwnode,
> > > +						  const char *propname,
> > > +						  unsigned int index, u32 *value)
> > > +{
> > > +	u32 *values;
> > > +	int ret, count;
> > > +
> > > +	count = fwnode_property_count_u32(fwnode, propname);
> > > +	if (count < 0)
> > > +		return count;
> > > +
> > > +	if (index >= count)
> > > +		return -ENOENT;
> > > +
> > > +	values = kcalloc(count, sizeof(*values), GFP_KERNEL);
> > > +	if (!values)
> > > +		return -ENOMEM;
> > > +
> > > +	ret = fwnode_property_read_u32_array(fwnode, propname, values, count);
> > > +	if (!ret)
> > > +		*value = values[index];
> > > +
> > 
> > You lookup with a propname, and then qualify with and index? is it
> > possible to have the different index but same propname? 
> 
> What is the question :) ? It is to retrieve a property value at a specific
> index.

Gah... I'm wondering what was my question as well :-)

See below: acpi_static_fwnode_irq_get() calls this read_string_array() multiple
times from within the same function.. 

Sorry for the terse message, apologies.
> 
> > Alternately you can send the list to caller and they can use the ones
> > they need?
> > 
> > 
> > > +	kfree(values);
> > > +	return ret;
> > > +}
> > > +
> > > +static int acpi_static_fwnode_read_string_array(const struct fwnode_handle *fwnode,
> > > +						const char *propname,
> > > +						const char **val, size_t nval)
> > > +{
> > > +	/* Route string handling to secondary software nodes */
> > > +	return -EINVAL;
> > > +}
> > > +
> > > +static int acpi_static_fwnode_irq_get(const struct fwnode_handle *fwnode,
> > > +				      unsigned int index)
> > > +{
> > > +	u32 gsi, trigger, polarity;
> > > +	int ret;
> > > +
> > > +	if (!fwnode->secondary)
> > > +		return -ENODEV;
> > > +
> > > +	fwnode = fwnode->secondary;
> > > +
> > > +	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI,
> > > +						index, &gsi);
> > > +	if (ret)
> > > +		return ret == -ENOENT ? -ENXIO : ret;
> > > +
> > > +	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI_TRIGGER,
> > > +						index, &trigger);
> > > +	if (ret)
> > > +		return ret == -ENOENT ? -ENXIO : ret;
> > > +
> > > +	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI_POLARITY,
> > > +						index, &polarity);

For each of the above calls for read_u32_prop_index() the allocation,
copy a value and does free it. 

Instead you could read the whole array, and just get each value and
discard it once? 

> > > +	if (ret)
> > > +		return ret == -ENOENT ? -ENXIO : ret;
> > 
> > Consolidate return to one place? 
> 
> Yes it can (and trigger and polarity can be just one property "flags", FWIW),
> if we agree that's what will do, which I doubt.
> 
> Thanks,
> Lorenzo

-- 
/ashok.raj
ashok.raj@oss.qualcomm.com
Qualcomm Inc
