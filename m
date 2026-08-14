Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09262426ED3
	for <driver-core@lists.linux.dev>; Fri, 14 Aug 2026 08:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786695162; cv=none; b=udB9mtoZELgX/I1AGA3WEJEflFQDuX9wTQm/rrCK7isI03ZegNEt7Jhi+9RcWnxWCKo7ZlP5VxCIEapxl7FhOyqh4qL/NI/wUVn2zEAdD87y/OWELvhmiEH2NvdSrduiOWbbgQYLZz17j91270R5couk4pNIxp9nP3q8CWLasps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786695162; c=relaxed/simple;
	bh=K9YBihvYTK7o0ZTnCm6u2s4/S7lO/g5EQ6oqUFhyMSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wp4rXAj3WbQ0Yt4efi4TNfa4QJyqwBt/ty0r96+KP+RCypVpluSwq+3TgOjcHZ8OmEjVFEP+lxdhO62DAIsly2MPYb/18OGVypqeXlczpcwvAdni7OvKYhWTzsGCnZj2tL2Vqh6aUrwcsrbQhAz45ZWjy1gzw+tG8KYhNT4ubZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=hFG4W94U; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="hFG4W94U"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E81YX9533164;
	Fri, 14 Aug 2026 08:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=N9rgzW
	OT5ERO/iBAjWJm0I+ZwZbpkreU6DGPLtd6BSk=; b=hFG4W94UBsN52vAbWS5Nf2
	Ref6hvaNWO/L1Lq/dWJmz+ZWEm7Gd6MydV9JPD2WuLtKdeH/oUhAf5SdXObMzuRd
	0o5ixw3TZiUhim8WVPAo4Q41xGQnD5K1d8UfYY/zRA7QKNYCUar++31RVBSYiSkV
	UhwTpKa4sUJNhHyjv9u14bsnoRVT0iYGogEMtrrkVG8fUfxnIVS3VYM/j0g6DxtL
	vmxyfP7cZqBjJ+plZhQJMh4zRZ4VAgKQtX+aEQY1g3fUzy7MlKWZ0fQrSTdyY0HV
	Utvngi22TNe4HDHbeWevauayz8KEqNIHavIg2CBOJF0WpguM0aYaJmM0DpyNVUcw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvq9uu82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 08:12:21 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67E8BeoK002250;
	Fri, 14 Aug 2026 08:12:21 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4g1rpv98gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 08:12:20 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67E8CJ7u50856226
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Aug 2026 08:12:19 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10D4720043;
	Fri, 14 Aug 2026 08:12:19 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A776420040;
	Fri, 14 Aug 2026 08:12:15 +0000 (GMT)
Received: from [9.123.14.142] (unknown [9.123.14.142])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Aug 2026 08:12:15 +0000 (GMT)
Message-ID: <ce787895-e2f1-4e32-b2c7-737e26c862f9@linux.ibm.com>
Date: Fri, 14 Aug 2026 13:42:14 +0530
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] firmware/edd: use kobject_put() on
 edd_device_register() failure
To: Tarun Sahu <tarunsahu@google.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Geoff Levand <geoff@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>, djeffery@redhat.com,
        Nicholas Piggin <npiggin@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, dmatlack@google.com,
        Pasha Tatashin <pasha.tatashin@soleen.com>, souravsgl@google.com,
        skhawaja@google.com, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20260813095421.1700945-1-tarunsahu@google.com>
 <20260813095421.1700945-3-tarunsahu@google.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260813095421.1700945-3-tarunsahu@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: iGVBPvI2HEE-VIn2U7aVn8Ny_U0OIQGn
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a7ecde6 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=1XWaLZrsAAAA:8
 a=VnNF1IyMAAAA:8 a=6E-QQtZnqdiRGRPtamYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA2MSBTYWx0ZWRfX3Rxe6UtmOwff
 goAzMiubQh1Cio/v7ELBpgC3WTABtPfcrjunBOXc8C83RbP8IOh+i17WGszVRe/Y/wCGlJ6vbaO
 PS0NtEV9JnagKpSL7nyIVmg/FmDflAZCDV76Nks1P4An+ikcVG01d7pOsOPK9sW/sZfwfvn6gML
 dUUx3jgv0U0DY5AOPjOWa3nuk4TTaGzwZ4ZXtEMXsr4wwS+chWpWJBBd/CfV4TJ6CVY0j8EPn+F
 QBqqd6esCnJXDefihis/OMaJfQpGZJJlau6ZuPXlgUPjVsdKV1kRfi3++LKGJgujYV0ohLAVlOa
 g47y0uHa/qdmp7m/D2fIN03Gmxlor+L1sHbJLzCRMiGEl2KLnUYG5HRpLitS66m2YrKTs5Y51+t
 +DChXn3p1mVN1LJgVZSF8KJOqtSrYpG9q9e4JX15cjpQBJW9kBXvL2i8leG8nqsXZbkQkdahP7b
 O7+3+zt/hBJbsTRCbqw==
X-Proofpoint-ORIG-GUID: CVJL8JRRoyCQS4Lz7jYUsO5wrEkc1bn_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA2MSBTYWx0ZWRfX18EkSN8NZslK
 7eNIj1Khe3FkPY1SKh+NnYwA/6UDwi0c421Cw1G45+U53760sTDpI+FjmXRs03/zYnZv5yfwj0R
 0xJ5Tq+EWLvK68LICgJsfttEuEfL9NE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140061



On 13/08/26 15:24, Tarun Sahu wrote:
> When edd_device_register() fails after initializing the kobject with
> kobject_init_and_add(), calling kfree(edev) directly bypasses the
> kobject release callback (edd_release) and leaks the allocated kobject
> resources.
>
> Fix this by replacing direct kfree(edev) with kobject_put(&edev->kobj) on
> registration failure.
>
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
> ---
>   drivers/firmware/edd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/edd.c b/drivers/firmware/edd.c
> index f980c5b56858..763e7b16d517 100644
> --- a/drivers/firmware/edd.c
> +++ b/drivers/firmware/edd.c
> @@ -748,7 +748,7 @@ edd_init(void)
>   
>   		rc = edd_device_register(edev, i);
>   		if (rc) {
> -			kfree(edev);
> +			kobject_put(&edev->kobj);

The EDD device is registered with a ktype that has a release function, 
so it is
better to call kobject_put() to release edev instead of freeing the 
memory manually.

Changes look good to me. Feel free to add:
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>


>   			goto out;
>   		}
>   		edd_devices[i] = edev;

