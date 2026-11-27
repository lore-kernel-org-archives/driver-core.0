Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770426;
	b=hmklwP5SbEIvO9f/TvyH8LJPqT+tL/jywBFtXYfjssdZ4sAmUFw6YDOQUcM7if7jrkaF
	 v3YvuzvNDBVd960rj+W85f18OSmuRQE24nTf7Kydan6yX9+K63nh9PI6gZPdxYO4QSQhZ
	 Q2ttYz206IFqzVIxQAIp8ZNLOEn1ZZ6p1WqrkzcgNBR3UL8sjz7KnOo/HLkessEVW8Cf8
	 gMvgc8jIA8UJWWzTLv1fH2DOMFtiQpbZxgSHDtiAuBTuLQoueB6uKvXBE0qq/SMu2EZ/1
	 Lv/gIGytpZbn9JCvLSZncV7JTMco2SjFPBaxsH6E71fs7xsBudPCD0uMNDO5f7NmEAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770426;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=NXCYAJxsQbgh2UjiFPTabP51WfJqGvz/GwVf98o9QN8=;
	b=5WfsYCvorrMy/SclwvrjAnH+wshjsrKtPCZY175XIEziqfo6/ULiDhWMdMZJskJvpURX
	 9BG65pc7R0pXrl6RqKYEu5LJ4umGD3NWQURhkn+/FIncCjfnrV7eLtTN8wcnz467TtXWa
	 NBfqH9vG9+kDRFS3BZsRsYrjD0X76/oGZrvYmfKc0gCPbTlNbfzFE/mg26wSwce3Rbc9G
	 HC/Td54mNaPjSMLHbBq3z6UuMC1JEAD9unGsIVJImjmGt+2D1rvqKHXlGzc1PzeiEUSQH
	 UaHehLMsB+UmsLtQQgZj6O/i3DAZCcS7XXFCNHmngTQudxpdtds5QtMFFZqH75XtzVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qHBhc1Qm;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29225606A31E
	for <driver-core@lists.linux.dev>; Fri, 27 Nov 2026 09:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29225606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qHBhc1Qm
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18C44BA;
	Fri, 27 Nov 2026 10:04:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795770262;
	bh=IyB6MEpvfevxD6X3VEaRcGsC0fCwQLyTFTNTgaTGi2g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qHBhc1QmMoT+YmmTHHfMT6i4l8vyhVWqeEC6VaYsQO6HWvMXNrOcknztWaeW9dGPc
	 lCrFaU8/LsGOWNYkJSlkIumBGiDkf9a1YpHYcXJ+NHpkNvHMvmhgWboUldrodQJl+i
	 lPpTpNMEaYGqNL7f2jWIb/C/Z9+u77QC35+EhA/I=
Message-ID: <4fbeef8c-1dc8-4cac-a4af-835037c3dc4b@ideasonboard.com>
Date: Fri, 27 Nov 2026 11:06:53 +0200
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: core: Add genpd_dev_pm_attach_by_node()
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Len Brown <lenb@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>,
 Ulf Hansson <ulfh@kernel.org>, Devarsh Thakkar <devarsht@ti.com>,
 linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261023-pm_attach_by_node-v1-1-4dbaccdf8b0e@ideasonboard.com>
 <CAPx+jO_FC1t_UaDfQDPOCy+V-Zdc1b5h5krrppGvYiW-LsD3LQ@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <CAPx+jO_FC1t_UaDfQDPOCy+V-Zdc1b5h5krrppGvYiW-LsD3LQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 25/11/2026 14:50, Ulf Hansson wrote:
> On Fri, Oct 23, 2026 at 8:17 PM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> genpd_dev_pm_attach_by_id() and genpd_dev_pm_attach_by_name() attach a
>> virtual device to a PM domain listed in the OF node of the passed
>> device.
>>
>> Some hardware blocks are described in a child node of a main device.
>> They have no device of their own, but they do have a PM domain of their
>> own. Neither function can attach that domain, as both parse only the OF
>> node of the device.
>>
>> An example case is TI's display subsystem and its OLDI (LVDS)
>> transmitters:
>>
>> dss@30200000 {
>>      power-domains = <...>;
>>
>>      oldi-transmitters {
>>          oldi@0 {
>>              power-domains = <...>;
>>          };
>>
>>          oldi@1 {
>>              power-domains = <...>;
>>          };
>>      };
>> };
>>
>> The OLDI TX blocks are not part of the DSS IP, but they are not quite
>> real devices either as they don't have registers of their own, and are
>> instead controlled via DSS registers.
>>
>> Add genpd_dev_pm_attach_by_node(), which is similar to
>> genpd_dev_pm_attach_by_id() but instead of looking for the power-domains
>> from the passed device's DT node, the DT node is passed explicitly. Also
>> add a matching wrapper function dev_pm_domain_attach_by_node().
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>> This is a new try for managing the OLDI power domains. Previously I
>> tried using auxiliary device/driver for OLDIs, and handling the PDs the
>> normal way:
>>
>> https://lore.kernel.org/all/20260529-beagley-ai-display-v3-12-7fefdc5d1adf%40ideasonboard.com/
>>
>> Then I realized an issue, mentioned in
>> Documentation/driver-api/driver-model/driver.rst: "-EPROBE_DEFER must
>> not be returned if probe() has already created child devices".
> 
> I don't follow. How is this a problem? Why not create the child
> devices at a later point?

The problem the above text refers to is (as far as I understand):

The main driver probes, and creates a child device, which probes 
successfully. That causes the flag for "run deferred probes again" to be 
set. The main driver then continues its probe, but, for some reason, 
must return -EPROBE_DEFER. But as the above-mentioned flag is set, so 
probes are ran again, resulting in the same sequence, again and again.

Creating the child device later is difficult. We have display pipelines 
which contain multiple independent devices. All those devices must have 
probed and their bridges/panels registered to the DRM framework so that 
the main DRM driver can finish its probe. If parts of the pipeline are 
missing, we return -EPROBE_DEFER and wait for the missing parts to appear.

And the OLDIs here are not really independent devices. They don't have 
register space, and OLDI configuration is done via DSS registers. Yet 
they don't fit very well inside the DSS either, as they are clearly an 
outside IP, an external encoder. So the aim has been to represent them 
as separates child DT nodes, which allows setting OLDI properties and 
the media graph, but there's no compatible string and it's the tidss 
driver that fully manages the creation/cleanup.

Here a simple pipeline could be:

DSS -> OLDI -> panel

If the panel hasn't been registered, tidss will defer. But tidss needs 
OLDI to be there too, when it binds the display pipeline, otherwise it 
could never finish.

It is possible to create the DRM bridge entity for the OLDI without any 
OLDI device/driver, which allows creating the display pipeline. But the 
OLDI bridge code has to be able to enable the OLDI power domain, and I 
think the only way to use PDs currently is via devices.

So if we created the OLDI DRM bridge as mentioned above, then later in 
tidss probe we could create a device for OLDI, which probes and binds. 
That can then be used to control the PD, but there would be no other use 
for it. And the sequence feels like doing it backwards.

>> The PD virtual devices used in this patch's approach do not hit the
>> issue as they don't get a driver, so they are not probed. The tidss
>> driver's OLDI part can then use normal pm_runtime_get/put functions to
>> manage the OLDI PDs.
> 
> Sorry, but this makes no sense to me. Considering the above statement
> about -EPROBE_DEFER and child devices, it sounds like we need to
> manage some kind of cleanup in both solutions, right?

Yes, but with PD virtual devices there's no probe, so they don't cause 
the "do deferred probes again" flag to be set. It's not the cleanup as 
such that causes the problem.

In some ways this does feel a bit like a work-around to the framework 
limitation. Representing OLDI with the aux-bus feels quite correct, I 
think. But then, all that plumbing just to enable/disable the PD...

So, what I'm basically trying to do in this patch is to provide an API 
that allows enabling/disabling a PD that's not in a DT node managed by a 
Linux device.

> Perhaps if you provide a user of dev_pm_domain_attach_by_node() this
> becomes more clear.
I have pushed my branch to korg:

https://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git/log/?h=b4/beagley-ai-display

The commit that uses this patch is:

"drm/tidss: oldi: Add power domain support"

And the dts file that has the OLDI nodes is:

"arm64: dts: ti: k3-am62p-j722s-common-main: Add support for DSS"

  Tomi

