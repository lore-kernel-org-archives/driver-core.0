Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055593;
	b=1wYabxwtJ5lqDlo+cBk+Zr+qhBR9EgHwxCA3K2ulZ9a0iwkEjVrbaRXn8Ee540EITpXG
	 cA2rU7WEq/GfeMCXa3K2goGL4QoA+tfP0Y2YreM9Fw0Li6U4Ww+TEiIJrS5Wru3LQ2o30
	 pFkUAABtlESdplLhH96Rn0j4gD5uM2bV2x5kiLTYSrYiOPMnsFe+z4O3rtJ6QtaN15AHp
	 9D6kgYfy0o8qlegNi8I3obV29D7RZJ5/I302beVy0KqiaYqtGIlloG4DeAvpbKjND1DMD
	 oZSCt/oMWIBGq8Yn0RHawHyLHprUGKbffRSimtGPSM9w6F1nTGlCIHocZMP4Qkz+2iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=xYFlSdYSBy4efBRscq6PIWjy+kL+seLzZByRLeIBFMw=;
	b=M/EIg9yaeLBSCd/zlgeA4TxDdMHTBblW9O9/2EHHmkjsR/laVeXY7B4tPzq8C2Hf1CUV
	 CfrTzNNV+RCxxbqnOnND9K8l1XkrVILRy7quVqpKxIUUWC/1lmN/hwpSc1WHI3vbBllvd
	 62FsTqR8wQazLUVH9w8QcVwntDUUNW+K3yGhhILkSixnU3heiJhkTXQSbFvWuxdjLaykJ
	 bM8Q7GXCwRr4rizsTrF3JcBNN5bY6zdVBI9KJ+fJaO0FTM8YZXfHzZTZ0YrxvmYhL3118
	 llsy6V4wJxSIiZ7j6gG/QOVn6D0JmJrUVeIvn0kXgP772/myIY2kwOS0TPPE2whgiIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="IM9QWrV/";
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13700606A321
	for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 22:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13700606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=IM9QWrV/
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53394bffe0fso3905981cf.1
        for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 15:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793055592; x=1793660392; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xYFlSdYSBy4efBRscq6PIWjy+kL+seLzZByRLeIBFMw=;
        b=IM9QWrV/b9NOc327xbxNeJ/6XoG78Qu33vpgCVsjzra/zhI2w68bEo0pWtfMAEGmQD
         njto5q2rH02dF+xGPuhRiWEH8+ZZ+mkHcV/Zqgl1bzlf+8Uk75z9/n7w2ao4Uc55k2em
         xrrlGz/cPfeA7OvFlGehN40N7yt7tJJWgaEJoPRnvxFHSw6svQSy/REAMk3cs5wzQf98
         n9I1nZz4EMrBN/8w5oTTLMLqK5AErtEepc9zw88i2IuViZOx3fjFWsxINJzkarnVi9a4
         MSFq9Urc2I9LXnmi8X4dBLeDrWBGmxBW0kVxgjACQE5MqmMqE+0uKqo4NlvrG5uqL0ta
         pArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793055592; x=1793660392;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xYFlSdYSBy4efBRscq6PIWjy+kL+seLzZByRLeIBFMw=;
        b=nAyleWmX65o7eSTUwfc7o84nmbbgSoUEH92OtoLr9jl9s7aFHSKwqi//RQz0H2eB6R
         P6+MRu0QCNAuY3SLP28srXThR9tA5L0p67DEYdHjxQFpK8lTY+zcvxgvAXPM0ZgGvr+e
         /k2m3a+9Y4uCnhklPIgu06f7chVWgZsJHQV6N7VEJGkxZdfnlIu/97cBbAhG3izL19XS
         WAnx+TEFJocm/SxznyRMGUnyES6s5Nqm7Mx+pZplSboYa9y9YsyzWcCbVXCEs+Hw0zjZ
         QH1wgtRxbQIlzPZVLSvm/z1YUGL/zcQsgHnoawtr7AG7HBvOGklFMwvh82bwfDZ/bkdz
         GcIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYyXriwCmo7/0wlCpvJtR1AFgDMNkeBl3S3v9A+k04uFrrdZZRTCvPgI6anWCTYjGoqiPJjShQORWp5A==@lists.linux.dev
X-Gm-Message-State: AFq9FYKZLxE8QgzghsSUVkzvdqFQtsehtm5YLorZNH5MzFqBnvHv/Sip
	HoaYD9j+ZU9n58Ii+tNNhdIKxTkDcCuOMM25BfnfAj0LoI1H+rLMZghekaqeLvHgwMs=
X-Gm-Gg: AYBFou2bE3+1lLe4w4SjBw6KEzU6gDsWlfhYE2i7IJSIbUhhO0r0tjDtqCttQFYqcR2
	rkhPhA9wpX3NAN/sB4rlbUuIOXtd0FjDv3i9PNsJ+1OSgRBrf4JfHlbtuS3TY6QK5M7Gu8pGrI2
	gR1QZZa2ZWdJgahbGFBIuzSA+9n0G8gGa4grqevh9YxLSlgHluyi7XQlJ0sRxwDVoEVKYerY74n
	zs4HiCKfl4JzGMRFrRFHf4p6nR0wKHy768VMNkMtQyOJziOXp/VTnfU69xC8FFh/QRQNQVJiYGZ
	I7iA46KvbndNDwS95q5jKTA1tDmRay4jFUBWaIVCDGQ0sR4Ou6SH/iR8JpLvv2n3CXoNBkB+ElD
	vj/MMUdc92lFVxqWGjwvTrBMJMB4Hc+myGsk3YOrp0Jnf8UR2QP8r2/JRlPVFw2nQa0K8s0l1kQ
	PshkJib3x4y3FCLVfRJAz4hxt08Dgvt+Y6NhVFaLUK1wVFiUn90onMsjF3tWR6YfdrLwD6fQy2A
	UU5EMkcbR8dayw7gPlixwG8RFhptE0UzfJFC7XMDEiVc1+Bga0nkD8Ly2N+4VOxjq5dXVlh0FX2
	G2+Db0TFp0zkKHBNFOVtSmC1MLJ9kmNZbmykLQ==
X-Received: by 2002:a05:622a:5c06:b0:536:60a0:5515 with SMTP id d75a77b69052e-53e3f95510fmr21198101cf.17.1793055592065;
        Mon, 26 Oct 2026 15:59:52 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970ac84sm65824991cf.20.2026.10.26.15.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:59:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLTfS-000000089Kh-2dEv;
	Mon, 26 Oct 2026 19:59:50 -0300
Date: Mon, 26 Oct 2026 19:59:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Williamson <alex@shazbot.org>, Armin Wolf <W_Armin@gmx.de>,
	David Lechner <dlechner@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Bradley Morgan <brads@mainlining.org>,
	Aleksandr Nogikh <nogikh@google.com>, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Thierry Reding <thierry.reding@kernel.org>
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20261026225950.GD1685504@ziepe.ca>
References: <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org>
 <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <2026102437-vista-unsoiled-b089@gregkh>
 <at34UOuYv3NtX36R@monoceros>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <at34UOuYv3NtX36R@monoceros>

On Sun, Oct 25, 2026 at 01:48:04PM +0100, Uwe Kleine-König wrote:

> The more I think about this taint, the more I believe the commit should
> be reverted and replaced by a some stop gaps for driver_override. (Be it
> a taint or better yet
> https://lore.kernel.org/all/0f7446324f6a0c8f0153d6532d92a6eeecd6a308.1790612298.git.u.kleine-koenig@baylibre.com/
> .)

I also think this patch is way too broad and should be reverted until
something better is designed.

To me this is very similar to the filesystem issue with syzkaller
fuzzing the block device and crashing filesystems. They said
filesystems touching untrusted block devices is out of scope.

Same here, kernel drivers touching untrusted HW are out of scope, we
have never supported that.

I think a taint from force binding outside a match entry and using
new_id are probably about as far as this idea should go.

Even this would still regress most common VFIO instructions though, so
some kind of disable for VFIO would be needed. I don't agree with the
assertion 'servers are already always tainted' that doesn't match my
experience at all.

unbind should not taint, we support hotplug, and manually binding an
authentic match'd driver should not taint.

Jason
