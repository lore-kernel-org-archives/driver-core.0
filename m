Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610E931A06C
	for <driver-core@lists.linux.dev>; Sun,  5 Apr 2026 03:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775359778; cv=none; b=Wleiyd7ZCWY+bfLrWGZejwJGnDTcUVTF+TuScMH5kt6C1WxIqwo5EVH+F+DKK/tS6YzSsvkCs7TEGZZ0QQB8h+mfkzZyb7RVEtws5+TtblqrDeb9qJqM4ef4ivyqx2C+afbh8mgUgEH/vbqSERAgdYwp/l/iNufCpFiB34kx/eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775359778; c=relaxed/simple;
	bh=X7d+KpQXR94kjEG5ZOzpx7nxRpIeuQhNidtplBVQ2dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EV4HALg+PZg/iRfNXpN9i6kLTQK3f2SybvmZdlpg+8D39VAfJmw8ZZ2znjCbWfQwk3FUmPvzU1x8WX9gbQEjQs+i4LBfApe/pMSADEkvEdeBazvbTmFrm0nFolH/3rlLp8UOnFQCATrfP2e593DiVHTw8yuWTVUSuLletXt9D4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oF7fQ0xl; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oF7fQ0xl"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b6b0500e06so4543635eec.1
        for <driver-core@lists.linux.dev>; Sat, 04 Apr 2026 20:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775359776; x=1775964576; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aPCZXW9hwwHLBnWUfhgTcLuDcn9cCDpsUAoc22QLIO4=;
        b=oF7fQ0xlekTZVS67VJqraq8BL7ODfAWfcp1yvfOitPs9DN2XokQlQjNYVyKRFBTrlG
         qNOKy9En0fTlkv51C1tTG75Pin0LMHMAaJqqPsG/TgFD6mEPZMANdCV+stIjD813+2Fs
         SW+hTc5/RFyJHvyK5xPGsqoWi7p7jAauofqa3fBNBTc24r9RK5L8MX9qcCLoL8gOoEj8
         ssLJ92x7UlcxG2nH2vGCyU076SJEYyvWrxgxBUCGyG3pdIifhqilaNHMqbTeuW8UZ6ke
         9BKJL3Fk47GSOCVZvWhB5d1SeIMYTgBYPr0sV1miUHeizPvuBCsmdh65ovvSk6Cmkrgi
         E1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775359776; x=1775964576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPCZXW9hwwHLBnWUfhgTcLuDcn9cCDpsUAoc22QLIO4=;
        b=QR9sbxIddCzgx+3nC4go+ybv1Kwa0OIREtgST6k76OF3+SiKX2DkdYjNQe8NKr3+M8
         TUPy8f1vqpQgegloqgo4eW+lOoWXs1NJBIIOk4ozHF08cOVQnlrUQNskrnxqLJy7lMFg
         C7IN35+H7bVsdKTNIvz1WttNHkckq062jE142OyYYT26n3muLALMTg2it97iamSPGL3J
         1KFYVzJexx1GwB+RLvvoY2WCK1eu2/ynXeA2bsGePfI14MbinQ65G4Si3+KslYAHyikP
         kYO6ojr8Gpreq2HloYyLt/GwKuKaiC/NXUeiNcdH1fY+1FWBKFeRjgwf//W9Fsqf5SCy
         R2LQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5aUmXYcq1DdRla8w5X5dRZ/oOP95LM+zhNX0vHW9quGst29Vj3aqzu5pXH6ZLcOelez+nojmrwxShVw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9MZBuhVXlSWz48ktXWldVjZX4szr81wvRhQV+wpNtvRChsxMF
	lto0Ue+Pm52lFfzl9BnzuMLocmLovsUrHEV27Urm6JwBaXbaZitQyVZgyX87jg==
X-Gm-Gg: AeBDieuSV7DlZGzl24ZsUXYJZ0bOp0KdYLkX2JbG2LyoExfpUKNapkZ2Wp9mbBWcYC0
	etpIeSO/hng6Ycsv2Eq7eKWAVas+vSEeFYzox7P8vOjk+3yhm8/qCtCsG5hADA7qM9rY8SqXvXf
	UEUwxOe9oDttdvhqjqS953beiUI/yxtEBU29/CQ/7vbP1DbGkvRiwGi3VtEYD8aMi+6gSi7ykkT
	qcsWSbefw84sEjYXuHVmdfArhy8tDAFpUHoo/sl7adVEVHy8JoIYjmp8X4RN/IsLR32bG9sb+rt
	Y1eR2qstwDdQGYfygVjp3TnW2HxBH4JYyo7aVL8waiPXIpU0klapWrRHOmC8s9sZdS2NBxXdkas
	q/rAfSkSxEuKSOQjMUs/UGK26frwQSMqYxaqfBUPHz8r5yI5rKZVV9bQQA4s0cJ+ofTJh0sVoWd
	5f6qclSBPIazTWs5ltuy4hvczZAE7Z6pVzvZ9WnHIfkjfRdYojDlyAFCmJ4+n+AOqL
X-Received: by 2002:a05:7301:19a8:b0:2c7:5a7b:e8c0 with SMTP id 5a478bee46e88-2cbfa5c38bdmr3807934eec.12.1775359776462;
        Sat, 04 Apr 2026 20:29:36 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:d488:726d:822f:a13a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c0c2sm9812953eec.17.2026.04.04.20.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 20:29:35 -0700 (PDT)
Date: Sat, 4 Apr 2026 20:29:32 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Hans de Goede <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev
Subject: Re: [PATCH v2 3/4] software node: verify that property data is not
 on stack
Message-ID: <adHW3Oou-fHnvRWm@google.com>
References: <20260329-property-gpio-fix-v2-0-3cca5ba136d8@gmail.com>
 <20260329-property-gpio-fix-v2-3-3cca5ba136d8@gmail.com>
 <acpRi0BOgT73pqpE@ashevche-desk.local>
 <acrvakIBxO76OAlU@google.com>
 <act_f13eyaBPrJ-w@ashevche-desk.local>
 <acuGxssSLHIYfUUw@ashevche-desk.local>
 <adHHVPN1O632XFf3@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adHHVPN1O632XFf3@google.com>

On Sat, Apr 04, 2026 at 08:27:58PM -0700, Dmitry Torokhov wrote:
> On Tue, Mar 31, 2026 at 11:33:10AM +0300, Andy Shevchenko wrote:
> > On Tue, Mar 31, 2026 at 11:02:13AM +0300, Andy Shevchenko wrote:
> > > On Mon, Mar 30, 2026 at 02:49:52PM -0700, Dmitry Torokhov wrote:
> > > > On Mon, Mar 30, 2026 at 01:33:47PM +0300, Andy Shevchenko wrote:
> > > > > On Sun, Mar 29, 2026 at 07:27:50PM -0700, Dmitry Torokhov wrote:
> > 
> > ...
> > 
> > > > > > +	for (prop = node->properties; prop && prop->name; prop++) {
> > > > > > +		if (!prop->is_inline && object_is_on_stack(prop->pointer)) {
> > > > > 
> > > > > I read more about this... Any code that uses vmalloc() (or potentially may
> > > > > switch to it from regular allocator with help of kvalloc() and similar) will
> > > > > fail now. While it might be no issue right now, this may become a such. So
> > > > > with this check in place you put a requirement that properties can only be
> > > > > allocated from a kernel low memory heap and not vm.
> > > > 
> > > > Can you tell me more about this? As far as I can see it will actually
> > > > have false negatives with CONFIG_VMAP_STACK, but should be OK not
> > > > trigger with vmalloced memory... But I am genuinely interested to know
> > > > more.
> > > 
> > > I dug into the history of this macro. It was added for the block and ide
> > > subsystems to make sure that there is no buffer supplied that may not be DMAed.
> > > As we know vmalloc():ed buffers may not be DMAed. In some commit messages
> > > it was explicitly mentioned that this macro fails on vmalloc():ed memory.
> > > 
> > > Note, I haven't checked the actual behaviour by trying that on the HW.
> > 
> > OTOH, the check itself covers only 16kB of memory range. I don't understand
> > how it can give true for anything outside that area...
> > 
> 
> You probably mean b4a0f533e597 ("dma-api: Teach the "DMA-from-stack"
> check about vmapped stacks") but it says that for vmapped stacks
> object_is_on_stack() will produce false negative (which is tolerable
> here).
> 
> I am not sure why object_is_on_stack() was not extended to also handle
> this. From the cursory glance it looks like a lot of callsites do not
> detect vmapped stacks... Let's add Andy Lutomirski...

Grr... now for real...

-- 
Dmitry
