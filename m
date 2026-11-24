Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795488526;
	b=ofN9unXqxPJ5dy4V05EUyysWspFme1Uw/Pxq6NJMe//yXTAKHWdNUq61mT2PnEy4N6CK
	 DANBfwfLHv8o13cERMnZXXHHHHz0ynCrbmZtAUML9f4oqPHEqMI/ij8oCuoG8NtrXwBYQ
	 m2UZp+u2xrYaYMk0I9vNQnXwHjYfy9sN3aaghwnFMZVHU4J8xfNP2//eukoZq0ehTKC73
	 vc8jdQYLf03l7fAgXI920+xh7pr5fuuV6dS/byaP1geQJPSmGhSleC3tienlLs2bRpDVL
	 BP11PMz66WJpKK0DSfDA7hkEz9Vo1JofTfXDTWlirTAIbI4Eu/wJFPinTNWMKYVPw9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795488526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=feBMC46Kg9xglm0UM1RjR22Aujb6Qvmmma1ih7AmJ8A=;
	b=UfnewoE/qtgJQHm5zv6dEu7UjH+03OB17JRI1ZtIKZu4tdMdihS+jBQETusZ4Np02AUd
	 yEvUoi0rvwUvOPadmNcKBi+ovnXdiR8TQ2kiZw0ug1UD8lBaclBASp19j6h7/ZImp5C46
	 3gitcOHD+0zKjZ6U00C0OYrMZJXwjXt798y2QYoWCcjhB5pP2my/mGPH+ZR0UTO2uxlqM
	 Fs1uwAB1OKDfDNSaHp+HnMlj02tMFpGPnjNVgXETTqHPrvLgK9+tDKKf0jSUNoCz1gPVS
	 LlIXgomoZosANWT5hiDeVWkLNHZNkil+mIDEGKXOR+BzsNz3QVW6FFEy7HtfmJoyZfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RtNA4YSv;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D39606A327
	for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 02:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9D39606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RtNA4YSv
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-9214b9e4d74so16031766d6.1
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 18:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795488524; x=1796093324; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=feBMC46Kg9xglm0UM1RjR22Aujb6Qvmmma1ih7AmJ8A=;
        b=RtNA4YSvLFMZ5lnSiZh1m1NlL+D+riCXGTcQdepviTMC3WSnMRhYxcLrqMYSyFcISA
         lc5MWZXgRQcIAsAbDjrgEqTk7DeXyYZZkiOm8X/uCU3eZtVKJK44Zom4T03iQ1AsVoyT
         Ysblwh8C/dugkHM2f0c7Fh0Epz+5BFxRCOOgTwFZc9cS5mbyKjmom07PZOt+nOjlfznH
         MFUlvndIDvQCLlNAIid00vWeHyvV3nrPiutokTEH9blml+TO3aC9SOSR2z5WXqsHP1Wu
         Ogmu+Tq4grBPADLinR+htLAeN+MAHIra8jOwTHLVZ0KugquZv+w+xIOtHSdODzTRKb/H
         d7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795488524; x=1796093324;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feBMC46Kg9xglm0UM1RjR22Aujb6Qvmmma1ih7AmJ8A=;
        b=KKNhzoQ57gndBqEvP0Ggs0lLGV9/NbECekicaaBz310uHgsnEP1dZY2jTtoRQk/1/g
         H8ufLigvtPG5hgEzD3JAieRTgEP08D5yXFBb2BOFoiSVK0xUrv0NqMC0PV/yBWUNf4DM
         t/STr9FP2m0b1goFPXuXbTe4y3znwJ5JSvwCVgWLcrcwtOhEdGmHApKPwci0PLhkYwmP
         iqJbC1SPiJCkp0gNqblFTfaGb3ZYgY3fUYYRzd6AXyREyw6Iyd2spH7YYylwIZOlYC47
         eyIdlQjjchX+bILKOPUW3nOFMD5IwS32Qq7iV+P8+VKpQxaO7EGcMWFZpqLfmr6eNgDJ
         cHdA==
X-Forwarded-Encrypted: i=1; AL+hErEKVmv8JXednHrMXppRiYLG2hR5wxExEahS+Q6mfzzLvJxBI5MvE6yNdmFI7uePOcphSPYUtnUy3AJN8w==@lists.linux.dev
X-Gm-Message-State: APuU4Z8nbRUtcvkzTw+QIpQq0HDrBMofF9zftPASfjqi7yxMqP0uJ7nr
	jOtm3PIPQE4QPA1hehgU7kC5t1IlfGaR95aOX/E56jfUVJRg7s023XQDjJ9bKhI4yzM=
X-Gm-Gg: AZFdTZd3ruJjbf7NU9fkXT4NYyaI0/MGNVcPXs3JCgPcKNI0dWrUNI67sx8RCLqx2ML
	Smzv55biZJfOEANhdxlQJba1mbI4VrhTPy9NjiSjUxQ1NzEkvZKtOLcEfkiqKzmBUKRxzFTfd5Q
	2YozZNPfsbmiyURCCv6jMjYPUFAS38h9w0sAxGztLSIDRjBynjfuqS7n9Ff6SCZIUmkU+URypvf
	KVosH4Cr//+FC7kvN1+S+ceIFS3x6K/ZSHKJxyz37N6z2oZZVvVbqLf1x9I11GSjgafEuv5LPMk
	KJgiu50bhvhaPKvY9hdPz4cVZcfJFJhGi0s7UcFuzFKjQBzzBO5IKV97xTrbW2VLT60zTXXtE25
	ZAb3MxY0YseAiGbkRssLofc1bHRRZbO7AOOzxoY42J5jymStTMQ5gJhodUnixxWFNwgNUvow/a3
	bc1d0ympKdTWdkMhedg8kUUTLI6IHap9pvP1ok7rQFUFGMVn6sskH9qky1JaYTjfQyiboViJLbL
	BZF1S33pzCsiOIDPCmFZrAVOIMr0qaZekwU43e5dlV0aURachCh5fpyvQ6gbMxPqUgzdpFWBj/8
	y5Rrc5w=
X-Received: by 2002:a05:6214:2263:b0:921:37ed:5c6 with SMTP id 6a1803df08f44-92137ed06efmr217313286d6.22.1795488523691;
        Mon, 23 Nov 2026 18:48:43 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d14d1sm122581686d6.18.2026.11.23.18.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:48:43 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVgaI-000000002sY-302b;
	Mon, 23 Nov 2026 22:48:42 -0400
Date: Mon, 23 Nov 2026 22:48:42 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v1 01/10] PCI/TSM: Report active IDE streams per host
 bridge
Message-ID: <20261124024842.GB9566@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-2-aneesh.kumar@kernel.org>
 <f377271d-353f-4c8e-94d5-98159a66ab28@amd.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f377271d-353f-4c8e-94d5-98159a66ab28@amd.com>

On Tue, Nov 24, 2026 at 11:11:49AM +1100, Alexey Kardashevskiy wrote:
> On 23/11/26 19:33, Aneesh Kumar K.V (Arm) wrote:
> > From: Dan Williams <dan.j.williams@intel.com>
> > 
> > The first attempt at an ABI for this failed to account for naming
> > collisions across host bridges:
> > 
> > Commit a4438f06b1db ("PCI/TSM: Report active IDE streams")
> > 
> > Revive this ABI with a per host bridge link that appears at first stream
> > creation for a given host bridge and disappears after the last stream is
> > removed.
> > 
> > For systems with many host bridge objects it allows:
> > 
> >      ls /sys/class/tsm/tsmN/pci*/stream*
> > 
> > ...to find all the host bridges with active streams without first iterating
> > over all host bridges. Yilun notes that is handy to have this short cut [1]
> > and from an administrator perspective it helps with inventory for
> > constrained stream resources.
> > 
> > Link: http://lore.kernel.org/aXLtILY85oMU5qlb@yilunxu-OptiPlex-7050 [1]
> > Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> > ---
> >   Documentation/ABI/testing/sysfs-class-tsm | 13 ++++
> >   drivers/pci/ide.c                         |  4 +
> >   drivers/virt/coco/tsm-core.c              | 95 +++++++++++++++++++++++
> 
> I'll take to the tsm tree, thanks!

Lets not take any new sysfs APIs please. These all need a careful
thing and we are not having a good history right now on any of these.

I'm not even sure what this is supposed to be for, is it debugging?

Jason
