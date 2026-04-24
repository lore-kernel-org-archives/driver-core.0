Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F623DEAD8
	for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777047102; cv=none; b=gAdkhilq6QW2CbYGWN6Xdj6915lAXsXl25SQse3gWLLHJALHZV/0d08NlG4yfSFHoTD9e1vnDe/nxWDI1+kMfUf4OsICMVWjjtLwi5TbXnLji6iEsHgQLrUIEg/WzOgB2/Ez2CiKA2AcN7Aj3B/MvLbTs1PWS08M77uFxxooby0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777047102; c=relaxed/simple;
	bh=cQxyjvvo6SHHGDnT8HL4AQEYPPr0G3qnZblljXvxfbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBGOwDOm0ZHSjJWEEpNUIENnxmnFXfuI9+XZVC8YQeSZlgbvC8YCux72bbxpkP0v28VLrkbvcYVeJY45iWHtsFLJRuNRWzGdvN/gYrISJXnTZvYBO5NvQIbPiUKEgTej/K36WCPDY28N7pACIPad3MEGe0S2oYAgQzHM5jlxWj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RgzAqBgs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIGGZiUG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RgzAqBgs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIGGZiUG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OB5CLS1959505
	for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 16:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QmsYx3pvgYXAO1jZPjQXfdfP
	yIwVCxRQ49qD+yx6sQU=; b=RgzAqBgst8mSwk93KlB/HsQ8M3+1B5WUWhboVVSt
	1VvJTYEzGzQ4lwATMwM1b3p7v0x+tk7eznRaMA/9gmgDGs2uVYDXr/6q/G+EWUaD
	cbLNKTNFgdVYztZzVXNeKPHYhjXLV3jS3vSCmLiMo+ch+8xf8mLNaHIt6ueeOIEv
	ts0KrQA0P+eJANsfTBFHAb6ZRMsLDAcBh3QSPJEYs3J3ygj5kqvqpIy3n2vBAq8B
	3bzXkmpEKifiISdgHA7/tmFrVvhsnNL448iH42cpBtC7dfCSUEPfK4AWXHYqmr6R
	+VgfAbQEJBEyV30IJQ+dMtoJf35AhLBEPA54bU7hU/uy0Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr2nrjk2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 16:11:39 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-610503b689eso9871058137.0
        for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 09:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777047099; x=1777651899; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QmsYx3pvgYXAO1jZPjQXfdfPyIwVCxRQ49qD+yx6sQU=;
        b=jIGGZiUGPRGcHkRWo0c3+PWCCEJpIFWbaDCD+uaJMOkk4apyZO8DoONJ5R7TgCbLMQ
         NiAhLN+bg4sTO+nKNMRk1NgMHBDo1n+35zI0tZu2MnG6qGwlyLwca+YCjRC+/g+53z82
         RgghsZ9jPiE8bqhBXahxfshPpncw9sc7/YXWNiCkOtz71BZefqDc7paWZvIDIqHEpfPx
         N5fnBNGIInWbLI9kBTEEgOjvqvXtWfUA+YABXVzKoV12Bu2iyPL7upWwvLovBFR6Qt/W
         1LEkJzYC19nA6PFdVXJgLemTEaTccXKUM598NjXCtrGr2O3h1cZIiZiVaxQGf9QXfiGG
         Qy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777047099; x=1777651899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmsYx3pvgYXAO1jZPjQXfdfPyIwVCxRQ49qD+yx6sQU=;
        b=tGExr3Xeo/BoS1h72XoF8/PHBCWYvnh9PXSRjus1ZbKXkRtvwR8ONJvo+5jNUSv96P
         IAUo1bWbNCf2xy8chk8FgbIPdJCov4VGpF/9AcYizOxEScVjxrwbdJj6KRtXwqZhW0uE
         WNkSgTMHy0UA4FDz3TV4luLXmSKOL2p0qSIttEjgfcWul7XlxMeADrUw2E24qe0ZWJ66
         /ghjZ+VYUadDdwXmIqbNd242z6MfEOXBvTB2ByXGVrUW/xM+0k+qOxDnh2TRXs1/Itvg
         xLV9X/MK9WW9W0cUdPPt5jseHQiqcQoWhv580Pgh1AZS29Al/aeh3qcAViwfups+SEgP
         xKyg==
X-Forwarded-Encrypted: i=1; AFNElJ9VbIuHP8A+0sXVysnSlI0+gsnsX6klxBjOTGnEJHyN4ZKVQTEvPI2Q5gW1snRt62Mw0wGi5o1Y5x6Epw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqaO6rN18yYXDNnW3MkzhVGiJJfAtcdUtF28MfStjieqbbaYBI
	CC/UpMDBqmzZD9S++A6GJ/8eHP0PBQsNc2GjJjeMdlxPCfbBf64TbR8Lejv35fw1RUf6fLKkdqo
	zoPOLi1LonRDxVCzSiH9K3UnFQLq0r2vmI72EUkGoYxje5U7rfE2spjNNUBSscQIZaA==
X-Gm-Gg: AeBDietng+8xk2fNm4aMLaFfZgsY351VhAMjLs3rAqlpxOjiiNjtITEDZIqJQdn6vMK
	4BXv8X5eiy3REX3uotnRO9PNR3FqmpJQRZQByxLp7f+nfCM9vv2i56ro4S8rt0hJCRo9nFqbSb+
	7UQH7GazY31IA3naqSdt7RGhUjAWc69ZB83i5s4fnY9KtGcPiNlNB2HsM3wNDgODutRhnBelga7
	BA66Hqrpy/0Qx4YPsc/jDbGZBzyjuzKVJ7rvNDeL2VwxVWNfp8XoBRH3bEvZWJinOUJm4DCMHbq
	Jal0fBFROqzNWjNvxQXG1/QPvXZPAM0UQTnlPawjcVg1vwM6xR29ILXDsGXvfCFPCgrQc6iHvTV
	mOCAc2CTSmXyJ10xjQ564d/9fu+DZdAU0kBHKy8R+AAFwXw4LRbIypMk2Q2kn/gfvUtN58PWIDe
	mYN6N8G0OK3CtmsVeb185DkXDPLvbquDqsSd6U4Vsb5aJiqg==
X-Received: by 2002:a05:6102:41a6:b0:60f:c9ba:b992 with SMTP id ada2fe7eead31-616f68d760dmr17881095137.16.1777047098735;
        Fri, 24 Apr 2026 09:11:38 -0700 (PDT)
X-Received: by 2002:a05:6102:41a6:b0:60f:c9ba:b992 with SMTP id ada2fe7eead31-616f68d760dmr17881013137.16.1777047098170;
        Fri, 24 Apr 2026 09:11:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad0c5sm6134967e87.10.2026.04.24.09.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 09:11:36 -0700 (PDT)
Date: Fri, 24 Apr 2026 19:11:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/13] drivers: base: Add generic dma context bus
Message-ID: <xuitjl6tzfl6nl4ds4vdy3637i5cqtjuqntcpqt5fnkx2ogcws@iapcavrwhyzv>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-2-0296bccb9f4e@oss.qualcomm.com>
 <2026042346-trustable-register-095a@gregkh>
 <06c04947-e72e-679b-493b-e112d693f391@oss.qualcomm.com>
 <2026042422-deem-chemist-8d0f@gregkh>
 <4c3fa710-f61a-4aad-622d-54909190cb9e@oss.qualcomm.com>
 <2026042428-blemish-helpline-7d8d@gregkh>
 <1e039dd5-da3f-19b2-ef98-29e64fdd925d@oss.qualcomm.com>
 <2026042442-luxurious-antonym-f20c@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026042442-luxurious-antonym-f20c@gregkh>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE1NCBTYWx0ZWRfX4BAstrMOzRny
 kl+O27q494LH1RygWPw8lc60bNJwxzI5CxGXctBt/XmgX3meFr5yvfLZ8LLF5q/wTn8kktL6OId
 emQnJ8GNo17s3PrJsZt8pAXsb9ec2XhXT0+Ij6VPJPhFedaxGp+o36jpE2nuFGhpD0GB/0GZECQ
 zsZ7ZWdUAeUk7KvhjnfTyoQL7TmXZhOtVTxUYG9Z5Ro24f9KhUsSbKRuMtcSR19B1/+UeN2kCtz
 ot+VCGelLGtb8+Zz/sufPuut/5NZdpt1WRa3kPLU+bZaICaT/oGXP6IPQSkOdNKXmXebdlBDaPB
 kbmOfFA2oNfCxkIQi7s0Dh0ECO05oDG4ma8xIOUkckDA6iKVSch98ITcaKHVC8QDYEmv9B8ldn8
 D8T07lY6W4ffQu0GJjbtsLK2dxATLlo6hkhw3ILQfqYim//jEdrAB068nkVwxw5WHrDQetZw2Bv
 /xJO9+Z4lbDPDZkvHyg==
X-Authority-Analysis: v=2.4 cv=UqpT8ewB c=1 sm=1 tr=0 ts=69eb963b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=7jvbHUuHxlDJpGpAObkA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 6jGr-J8AUShDAEcMDEt95MEa_Z9q69l_
X-Proofpoint-GUID: 6jGr-J8AUShDAEcMDEt95MEa_Z9q69l_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240154

On Fri, Apr 24, 2026 at 03:34:38PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Apr 24, 2026 at 06:12:09PM +0530, Vishnu Reddy wrote:
> > 
> > On 4/24/2026 5:25 PM, Greg Kroah-Hartman wrote:
> > > On Fri, Apr 24, 2026 at 05:15:02PM +0530, Vishnu Reddy wrote:
> > >> On 4/24/2026 4:43 PM, Greg Kroah-Hartman wrote:
> > >>> On Fri, Apr 24, 2026 at 04:01:13PM +0530, Vishnu Reddy wrote:
> > >>>> On 4/23/2026 7:07 PM, Greg Kroah-Hartman wrote:
> > >>>>> On Thu, Apr 23, 2026 at 06:59:31PM +0530, Vishnu Reddy wrote:
> > >>>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > >>>>>>
> > >>>>>> When a driver needs to create virtual device at runtime and map it to
> > >>>>>> an IOMMU context for memory isolation, there is no common bus available
> > >>>>>> for this purpose. Each driver ends up implementing its own bus type,
> > >>>>>> leading to duplicated logic across multiple drivers.
> > >>>>>>
> > >>>>>> host1x driver implemented its own bus type to attach an IOMMU context to
> > >>>>>> a dynamically created device. The Iris VPU driver now has the same
> > >>>>>> requirement. Rather than duplicating the same bus logic again, a shared
> > >>>>>> bus type is introduced under drivers/base that multiple drivers can use
> > >>>>>> directly.
> > >>>>>>
> > >>>>>> The bus takes care of creating a device and attaching the IOMMU context
> > >>>>>> to it based on the client inputs.
> > >>>>>>
> > >>>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >>>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > >>>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > >>>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > >>>>>> ---
> > >>>>>>  drivers/base/Kconfig            |  3 ++
> > >>>>>>  drivers/base/Makefile           |  1 +
> > >>>>>>  drivers/base/dma_context_bus.c  | 77 +++++++++++++++++++++++++++++++++++++++++
> > >>>>>>  include/linux/dma_context_bus.h | 26 ++++++++++++++
> > >>>>>>  4 files changed, 107 insertions(+)
> > >>>>> as you can not have a device on multiple busses at the same time, this
> > >>>>> makes no sense to me at all.  "dma context" is a bus-specific thing, so
> > >>>>> please add it to the bus that you are wanting it for.  It can't be a
> > >>>>> generic bus as that just doesn't work.
> > >>>>>
> > >>>>> Or what am I missing here?
> > >>>>>
> > >>>>> And why is DMA somehow "special" here from any other hardware attribute?
> > >>>> Let me give brief information which was discussed, in the initial series,
> > >>>> the iris VPU used platform bus for dynamically created devices and we got
> > >>>> the comment/suggestion from Robin to implement a proper bus_type with a
> > >>>> .dma_configure callback.
> > >>>>
> > >>>> https://lore.kernel.org/all/02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com/
> > >>>>
> > >>>> based on the discussion, implemented the dma_context_bus and used for iris
> > >>>> VPU devices instead of platform bus.
> > >>> Why not make a irus_vpu_bus where you can do what you want?
> > >> Initially iris_vpu_bus was introduced, and it was made generic based on the
> > >> discussion,
> > >>
> > >> https://lore.kernel.org/all/20260227-kaanapali-iris-v2-3-850043ac3933@oss.qualcomm.com/
> > > I don't really see that request here, I see a "make this better and more
> > > generic for other busses" but that does not mean "dump it into
> > > drivers/bus/ for someone else to maintain" :)
> > >
> > >>>> Here, the device have only one bus (dma_context_bus), not multiple buses.
> > >>>>
> > >>>> Regarding the "DMA" naming, the core operation of this bus is its
> > >>>> .dma_configure callback, which calls of_dma_configure_id() to map the device
> > >>>> to a corresponding IOMMU stream ID. The name "dma_context" reflects this
> > >>>> purpose.
> > >>>>
> > >>>> I am open to suggestions from you or Robin or anyone else, if there is a
> > >>>> better or preferred way to achieve this, I am happy to consider it and
> > >>>> rework the implementation accordingly.
> > >>> As there is only one user, just make this your own bus please and do all
> > >>> of the needed bus operations for your devices there (i.e. don't hang an
> > >>> "empty" device off of it.)
> > >> The reasoning behind to make it generic was to have more users - host1x,
> > >> Iris VPU, QDA on the generic context bus, instead of each of them having
> > >> their own. Let me know if you suggest to have the iris_vpu_bus.
> > > But you did not add such users here, so how would we know this?
> > >
> > > And still, I have no idea what this bus really is doing.  Is it dynamic?
> > > Is it self-describing?  Why not just use aux-bus?  What is it supposed
> > > to be doing and used for?
> > 
> > This bus will allow users to create a dynamic device and map to IOMMU stream
> > ID via .dma_configure callback which calls the of_dma_confgure_id() based on
> > the user inputs. This bus is under the iommu_buses list to register for bus
> > notifier callbacks for iommu_probe_device() and iommu_release_device() during
> > add and remove.
> 
> But a device is nothing on its own.  You can not just have a random
> 'struct device' hanging out there that does nothing but iommu, right?
> It should be doing something else that is very "bus" specific.

Unfortunately, it is a pattern of IOMMU-only devices. All the actual
programmig is done through IO region associated with the main device,
while subdevices are mostly used for DMA buffer allocation.

> 
> Again, why not create a bus for your hardware type and have that control
> the bindings of drivers to the devices, like it should be done.  You
> better not be creating platform devices for these things :)
> 
-- 
With best wishes
Dmitry
