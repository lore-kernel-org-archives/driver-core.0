Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795142866;
	b=SVftsr4izywUJUQw6pUY2VLrc175+SJWDt8KoXpCM551NwG6sqK/3bjddzrJlEMYyfI8
	 VWQYIfuc8gr/AFMdG3u2FjfcQ3m2f/dXiVEJ+soHhovOdj+e0qApbcNBVjTu/UaeKxN6a
	 1ilAQN8lgwZ4hb4wSDJ8RtgxDTjvR4SdyYmPi+Tegtqj1nivixS/J0VC/Eoe6GW3gcvFM
	 3CTdK2cWctjMqdgoyH6JOHxlQbQmKOXKRNCVKfARMh8ZUYA1LGgaUgwSdU+tNKWRVtY+s
	 oCYMDvXQ7UvU1rz++E8NsDjJaaUy5/uOKJlsQU9Dtv7HZKrO4foM156vb9CrqWA6N/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eVrCKlzH4lLszUutPiQuTSZmQWPqwrLEs6IIi6j3BbY=;
	b=N/NxQH7vKNJF4mPWx3qlb9bs5A9kistV9AgxQbW6IOI0Gt5C5UoRKn3U7MOF3kNl/KRW
	 BQGZP3TVFgCtXJgTk9KBx/Xv17Yb7T3b4hcWCVMzDohCwI5gfA7q3E2dXxK7RZmSmG/os
	 Z9BLOIE4IST/FffVWcNPtDFgsQHzXxlYfWVyLcUW6zBLl63MqM2/xBISnofICDzxve3X8
	 J/9tkoE/mpPr++3njEt7sq59NMjhuBxfQYqyDKGSCKSij1qOQUOAJb3j8upinCjSB377q
	 ntLnolrO81z/jiqEmZY37GTzK8QoUDmbT9QudVNmeoEx9JvsA30i45MLN5O0YVHOFoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=LOtnbGQd;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE5D606A325
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 02:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFE5D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=LOtnbGQd
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5366ae57896so4675201cf.3
        for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 18:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795142864; x=1795747664; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVrCKlzH4lLszUutPiQuTSZmQWPqwrLEs6IIi6j3BbY=;
        b=LOtnbGQdbhWHV0g21yj29roVF39qbMS0U91Tpd+KXVYhYAzcERFbjEkWTB2WDZskWr
         nmD6l5Rsb8BGRG/TJAkD2/fJLSPcqYOIK2lCq+IgdWYs94zE34ZhZaDDnL06Gery9e3n
         uyUUx01eS55uVwBRC7P5WzEIGXnVUN1edvPWRS2tKvfP2loskCrPk/Ge5o3DBsZc4UzV
         859zOfhIT4ycEC47vnzTh0ITgbcSYl/BkTf4BodnaM5iLydVeCzBAF3IZlsWdaRbXB1e
         y0b6TsQCJOP3oN5AegJdZXpgd1FkTTRKer99h7iWEdbwTKz6N1CfKcYBifi1wmc1Lo2u
         Vreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795142864; x=1795747664;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVrCKlzH4lLszUutPiQuTSZmQWPqwrLEs6IIi6j3BbY=;
        b=i3c96JWHUEuyuQBlPXXvjuGC/TtRXLJWJosWfPGC+INsEUsI2a51n3t7eav/D1eq04
         mw17DFnvYAeSme5Zbe1Qys8tKSLuI8DZzf/ldJAr44an88kadk3Kh0CYQN933+j4pKVc
         t9Aq1OwTP+k8YCakbXHWvBcN/x67ghisrBOGkZRiH966FaYn4UF0H9gqrQv7MBcxob6z
         M/Jk9bp2XBhUl9SOlQEHz/avAAaGiBoCt74646kSohikJ2d/d9i8n1LkR8Or8iwL+Kcd
         Ffe/VrObVCddB7Vtbv1g5Y1vmwOlQnc3X+Y0iW7l0rOgS3E4DlqZB73wNUxvTAxdX/Yo
         PmZA==
X-Forwarded-Encrypted: i=1; AL+hErEZVDnoAmQJVtGw3D+XREHNM3rDs83niuL6gyEXmBlZzg2COxKCSd8PH4znzdqU7XF+U1dzk7IdhwS0cw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+yN0344fLGspa9ySpx6y+N8EQ9Ozcbz1AWYQ1ZSZTJI1xJeFCX
	1pZL3gbunHoNA8obXMbiZxG2c0DyMX6b8SRRkWb0TGHaBcjatd7Dy7ySaNcLjlumdA==
X-Gm-Gg: AYBFou0P3bn51VxHjxshFP0/v16srEoDu+kZyM1N/TC3opnx0LpE6mejkKbuhZVBuhf
	q/lSvQ1BLsgZ1yF3NON19DiOxt9e4Cd9F2Px/fEf/Ff+sZ/ELnfZ0L5d1ZAzdo2fj8bnWp2UBjr
	+MhOeW44XFcJKpcUSc/H8QzcjUZ7dParnqJskK/VxfS2abrm01SI3u+NXd/5vRk1l5k3VJZjyQ5
	gD69mq3L5GSVJkoCaXCYYyWM7slfPvB83b/TT/tYKEb7Mtc90kBBrQKeuj1S9L24JvAiK1eTDTG
	MeKWkOj3yycPsN/WlGc0iiTwHgHdCdEghzLSFYvgTD96UjPxYwXxcwyTDPMjktX5UH0hQtL5svl
	Esw1cd7Hwy4h0tINx1X+Ojh7idRPomdN6q1uHnJehRIXYRTG6nxjUr8odmckH2D8BG0lggOix4H
	AxJwE0oso6dHpAqdKpJRlCyadi8UWyoBS5vrMOBqoa7EnuZFPPVygeyq5a1fQ8C8AOVZadQN2kQ
	L4jrln5y/RwXQpz51+/UazOlijhqh9AG3ryYLCFVyDTrFw+Q2AQYN2G74Jh/VNuE8NLUzW2RB1a
	fyjx0pJWct9e/joC9leSwZ+dSFoW72xC6a/kjgkk6/xiWVJY5W0=
X-Received: by 2002:ac8:5f0b:0:b0:54b:5cc6:6036 with SMTP id d75a77b69052e-55d76afed61mr34895051cf.58.1795142864676;
        Thu, 19 Nov 2026 18:47:44 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7887bec2sm11008161cf.22.2026.11.19.18.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:47:43 -0800 (PST)
Date: Thu, 19 Nov 2026 21:47:41 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Linux Driver Core Development <driver-core@lists.linux.dev>
Subject: Re: [PATCH v1 2/4] PM: runtime: Drop space characters preceding
 labels
Message-ID: <c1a2c90f-c667-4bf2-bbc0-2cb3f840ad97@rowland.harvard.edu>
References: <1978814.tdWV9SEqCh@rafael.j.wysocki>
 <3453847.44csPzL39Z@rafael.j.wysocki>
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
In-Reply-To: <3453847.44csPzL39Z@rafael.j.wysocki>

On Thu, Nov 19, 2026 at 09:17:08PM +0100, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> Drop space characters preceding labels from the core runtime PM code.
> 
> No functional impact.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---

There actually is a valid reason for keeping the spaces before 
statement labels, although you may not agree with it.  Namely, the space 
prevents "diff -p" from thinking that the label is the start of a new 
function definition.  That's why I put a single space before statement 
labels in the code I write.

Alan Stern
