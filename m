Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D772651A148
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 17:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788403; cv=none; b=japbR/pFHb1LyEYNlpGpowGp4ouYVi9ZtRluxpbXHCKj+J+HlWU5eTCzOy++TYW6EkQgiK8SKGYQNYgNPWWZzAUB+HsifVQ5hJmB4bWEobNgNPYm+ogM3IdojYVdLZLR76+SIZlUL6Rhgu1Yq3nChgZA9m1T2spDFhFl2/spIZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788403; c=relaxed/simple;
	bh=mTbMS1Q6x0ikZ7WhZzFqZfSUagkt7vofDYssUYGqQKs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZCdBXVdNUC43GOcnQM+GsPENxHTkoNEAKEQrzMLWw03wvT6L1Jd0gs3Ajx1Wqxyf+iFINyERq4COzU0JQrX4WiYep43NO/WNSEMy60sIzElT1zYDW2E7nnWUiDi3njcTqiQiyMoklggYm7M1omRXSJl/nFAP/CVwB1GHpi7ZhVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9GCeUXw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQNa1AuE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T9GCeUXw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FQNa1AuE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxlfH612265
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 17:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIlPm6pWDwXvYMREQpH7upT+sWXfZsWEKBokElxA+N4=; b=T9GCeUXwxuB0S8FV
	7hamSltKIsDOypIJKVts7D13C1aYuJU0nUA6dP6NsWPFldrG4eCrcR/nd7Z42sCT
	Lw12RNy7k1N8b3kpBkyO2NS1wWHfCL5fPDoJ2dv8yX+uY+WHW+GynCYA/KDdK2QM
	a1b+IM+8jUAgSgMukGkHma/7gQzfXoOngSV5Xw9eH+caoEKmUZgWXlels+OM4IU+
	XDRkoymieASsHv5V6DZbcruNx15kSRrdfrTo86Dd2FEf28+nLiBSqhbh2D9JF20U
	7Y2Pa+ML8Qc5HUaowjQ2Hbz9bidKsJzoi3e/4rqmt/bMlb6ANn4+yZVGfPG407Od
	Qj8dkQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh824d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 17:13:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deda201bcso9095777a91.2
        for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 10:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790788400; x=1791393200; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RIlPm6pWDwXvYMREQpH7upT+sWXfZsWEKBokElxA+N4=;
        b=FQNa1AuEkglifFzYWboojQFteBnPCdQa2YgfnhffcDVjj88VpHvTwkfgXDWCf1jRbG
         5/DuS/dngl75zaZT28D+cpjsKyQLbt1UO5IBitFlb4SR9qPu+7Hhb+N2ioSncI3Dxcmo
         pssqGplzb6WPXRpvn2aT1v0XbypEVnlegZbPaXS9mCBlGvpOmelZswnx4osGD/B1Qfdz
         H/BESwrm7Nm6ENsS9O5rd+HXEqJ4bI5SKMLaS/j32L2NWRSV7CfXGa0FpY5CTR4k2KBx
         p13zth4a8+O7tOc+SgQuUJNEIhlDVrOznRKx0cZ9J6u+OkBpRFsepVQs2XQM3ApLt45q
         h+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788400; x=1791393200;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIlPm6pWDwXvYMREQpH7upT+sWXfZsWEKBokElxA+N4=;
        b=yrw66lzvupDBz722rHi2qBUyQrMwhtfD5L9C0lZsuHMzY/+MqPMSA0gu/bmYimcsY3
         1neSNzp9vxVaBh2ytR21lrtu2jeKEVSBd7XdzdvVUhGSVHNNZQJlYo/rpgEripHtti4d
         +g2eCgQ46k4y9ZxZ3RRotzVT5W+kzn8LKx+Cmj3oCiexxIzvQg/90vS4IGBl28raB9q1
         KVx0NiUZZD+w+BG+i3Qq+bqPW7ISfpjVmqKX7lDoQk9i6C2dc9ufJdhKpdbeYUg7sswH
         /1qvugg4iR885WIW1rK1ZWav67HrA+QyegjWb/LFlOzAOh0nKB/onZ1sU8MiGzgCrRjT
         eSRA==
X-Forwarded-Encrypted: i=1; AKwUvBynztsOGVs3zFev1c28tioAMbbm3zPjmRK5uzfhWnqX9/sKu/TfvJ8yParU59sMNZ8Wo/lFeTrY9JOyNg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLNnPw9s0ucCaTkRoabKc8JWhIKIRqTOBPmmjUnVBfpZ4Isl0q7
	GuUwsI5DAlUZy4pPNYj715RUnIKqArbiKFLv555Txf/C4d7lSEFc0YPh+67xd0PbxJYRSFHL1Je
	FzN2N1G8K9QIxBxaoXwICNIpf9EOTnSzqCS6ZZPiTBAsVLZ8iHS9UXYBB9kpL4H9G6w==
X-Gm-Gg: AYBFou0HVDXbhiyWhQA/X5gaZx7/kvygtcYaiLnh9EpLId5esE8F/4duVEQpUuo7320
	ZO+d4c1eI/oOEycEs7KWX6ZA65U+3zksD3t0AtsHzZhjbtn2vodKJf8ZciZ1koqgv603Oo8jKTs
	gDjBrbXOcPxo5MeU/uj4JgqrFBT+370tiQvB+F9zdAKK6CZQHCWlT0s1ALsvIeiMfX3BGQT7GR9
	Uf0LNQnALR/lzHBgUg+J7zo7wc9hVxIvjFYY50eDHktWu7HKr+l5hGx3WttockgeDJCh6q5HV55
	XT8tZGnJxdKCLc06ABFHLFthfltxzg4T0N0TdU8oSPAEzxgf4UFy5fi1bN5Z/VzfuF9V6It62jx
	IOGa6LFf4d3eIF1qb3XuqJKOCYpEF7/Ni2JwRVPUnMhO53zF+d71CtlY=
X-Received: by 2002:a17:90b:4a8e:b0:3a4:bda6:16d0 with SMTP id 98e67ed59e1d1-3a4d1913daemr1778376a91.55.1790788400171;
        Wed, 30 Sep 2026 10:13:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8e:b0:3a4:bda6:16d0 with SMTP id 98e67ed59e1d1-3a4d1913daemr1778192a91.55.1790788396385;
        Wed, 30 Sep 2026 10:13:16 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f478e750sm199420a91.13.2026.09.30.10.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 10:13:15 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:13:08 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier
 <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas
 Gleixner <tglx@kernel.org>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Hanjun
 Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Wim Van
 Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Robin Murphy <robin.murphy@arm.com>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RFC 02/11] ACPI: Introduce irq_get() for static fwnodes
Message-ID: <20260930101308.00002fb5@oss.qualcomm.com>
In-Reply-To: <arqSqcoWAkhy-8do@red-moon>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
	<20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
	<arZDwutoadki7tiZ@ashevche-desk.local>
	<arZNL9BnTGK0Klwc@red-moon>
	<arZS4vwxps01dGb7@ashevche-desk.local>
	<arqSqcoWAkhy-8do@red-moon>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX4pfZksZ7xYe6
 13FFnV0YRiQdgW5doy7OoVe1p8uHP2ojt9AUJMbQcgylxejMVbb05MYhaL+cxRzgr3TfgcY6dQS
 LOrYbl2ahfVgQYkZAAVvATfssMy+SbiVBXeyN4JM9nUmBJUURrO6/A2WkYsVxw6ABUV/Z3lDXIg
 cyadgE4ALwcX2IbpIdZvW3zeKYTpyJBZfJQurKcRoK/Nv+lCyJhfUPPhJdszQUrTndrW54W34nQ
 8PubRaZB6XCW8TRV9Kiyj1WmLfeC0rKxvK3rC80TdsMGCc4TXGluXHAJ8KiAhBZnWY1bwDX5xQL
 M9NVAIEnw4A1t6343BO2Grcx8JryjIPfIOB2ju1QADDcI8gfERdowbXjw1i1NaU7ltyNatcFuVo
 blfKWdhoXqrzmofGzSZyaA8OLGOHM6YOAW7Qh/czqdSGscxjK+6D9hmPsNgyGHxA/DlgIBC7otF
 PmhNUwnRABZF2tw5IpQ==
X-Proofpoint-ORIG-GUID: iUi9qVuuW3O1rNYS5Y07AQtxUoPAmjik
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abd4330 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=u08uBHW3MJJG4PD1gAcA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: iUi9qVuuW3O1rNYS5Y07AQtxUoPAmjik
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX8aeyaHbwW/v+
 4azBhydJ+m1j7snl3llqBhvSgFhiMYKaRoZY7+dncAOwV1ccj+TwboxAOepLe/a37HAkqfEdFxw
 pqN5yn0H9CPDJ9NJbDe+IQq9escBTXo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300068

On Mon, 28 Sep 2026 18:15:37 +0200
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:

> On Fri, Sep 25, 2026 at 01:54:26PM +0300, Andy Shevchenko wrote:
> > On Fri, Sep 25, 2026 at 12:30:07PM +0200, Lorenzo Pieralisi wrote:  
> > > On Fri, Sep 25, 2026 at 12:49:54PM +0300, Andy Shevchenko wrote:  
> > > > On Fri, Sep 25, 2026 at 09:48:01AM +0200, Lorenzo Pieralisi wrote:  
> > 
> > ...
> >   
> > > > > +static int acpi_static_fwnode_read_u32_prop_index(const struct fwnode_handle *fwnode,
> > > > > +						  const char *propname,
> > > > > +						  unsigned int index, u32 *value)
> > > > > +{
> > > > > +	u32 *values;
> > > > > +	int ret, count;
> > > > > +
> > > > > +	count = fwnode_property_count_u32(fwnode, propname);
> > > > > +	if (count < 0)
> > > > > +		return count;
> > > > > +
> > > > > +	if (index >= count)
> > > > > +		return -ENOENT;
> > > > > +
> > > > > +	values = kcalloc(count, sizeof(*values), GFP_KERNEL);
> > > > > +	if (!values)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	ret = fwnode_property_read_u32_array(fwnode, propname, values, count);
> > > > > +	if (!ret)
> > > > > +		*value = values[index];  
> > > > 
> > > > Use standard pattern, id est
> > > > 
> > > > 	if (ret)
> > > > 		...
> > > >   
> > > > > +	kfree(values);  
> > > > 
> > > > You want to use __free()
> > > >   
> > > > > +	return ret;
> > > > > +}  
> > > > 
> > > > I believe the whole approach is suboptimal, if you wish get indexed value (but why?)  
> > > 
> > > Why what (that's what the irq_get() interface requires ?) I agree it is
> > > suboptimal - the whole point of the series is an RFC on using properties
> > > to store GSI number/flags, then how to read them we will optimize it
> > > when/if we agree that's the approach to be taken.  
> > 
> > Why to have indexed APIs. The callers usually do not want a single item from an
> > array, they want all of them or a big pile (exception is the array of strings,
> > but we have matching functions for that).
> > 
> > As per approach, this patch is against device property and I don't think we are
> > going to agree on the approach taken in *this* patch.  
> 
> Coming back to this, what is needed here is a way to stash the GSI number,
> flags and name in stardard storage (like OF nodes IRQ properties, ACPI objects
> _CRS, etc).
> 
> To give you some background, I thought about adding an array of:
> 
> GSI [number, flags, name]
> 
> to the ACPI static fwnode itself. Then basically the irq_get() API has got
> all the information it needs from the primary fwnode; while doing that I
> thought that this might have been a bit like reinventing software nodes
> (granted, software node properties are ways more general that what I suggest
> above and I don't expect any other property to be ever added to static fwnodes)
> that's why I put together the series as it is, precisely to understand what's
> best.
> 
> When you say "against device property", what do you mean precisely ?
> 
> I suppose you mean that this approach goes against software node properties
> usage guidelines ?

For what it's worth I like it.  Clean (ish) solution for a messy problem.
May well be some details that can be done differently though.

Just to provide a counter point to Andy :)

Jonathan


> 
> Anyway, again, it is just to provide some context, we are talking about
> a bunch of platform devices, it is nice to have a generic solution but
> it has to be simple enough too given its scope, I understand very well
> your concern with this approach as-is - it is there to find a way
> forward together and show what the problem is.
> 
> Thanks,
> Lorenzo
> 
> > > > it needs to be retrieved as that in the guts of ACPI. Allocating memory for the whole
> > > > array to retrieve a single element is simply wrong.  
> > 
> > ...
> >   
> > > > > +#define ACPI_IRQ_PROP_GSI		"linux,acpi-gsi"
> > > > > +#define ACPI_IRQ_PROP_GSI_TRIGGER	"linux,acpi-gsi-trigger"
> > > > > +#define ACPI_IRQ_PROP_GSI_POLARITY	"linux,acpi-gsi-polarity"  
> > > > 
> > > > Oh... This sounds like a big ugly hack.  
> > > 
> > > That does not help much I am afraid.
> > > 
> > > What's a ugly hack ? Property names ? Using properties for this purpose ?  
> > 
> > Yes, properties started with "linux," for some core functionality.
> > Yes, using properties for this also doesn't sound right. I think the problem
> > here is in the table specifications or somewhere that deep. That's why we
> > ended up in this series.
> >   
> > > Again, it is an RFC for this specific reason and I mentioned that in the
> > > cover letter, thank you for your inputs.  
> > 
> > And here we have a discussion started :-)
> > 
> > P.S. Looks like I was too quick to jump into this thread. I will wait for
> > others to share their view on all this.
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> > 
> >   
> 

