Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1009371CE2
	for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 08:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254601; cv=none; b=gBo04DiAc6x0Tju3f6dxz6ITpPolALcrTLDqjtu1WO2KCL0uH6hIypfA2I8uAuwJJTX8eF75qmLfB3zXqaBLEVJHnsVAZXmMGG8ZCL3rdbs2VSlhkfxS+Bpm1VrSdVWP5Z4lxtav/qVdtuXv9XQWKYPQYXeF2zFl4dkmf77G5AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254601; c=relaxed/simple;
	bh=izApThMnkGomAbHMNy7dSnB84greHvo9TN/4/HGY7jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JA5lZYWTkfB9a6OHO3wPCzfiV8wUMN05iDXxbk1mIFIA2Gl4F3U8n7IBhf7UXHFG2kY+I5mUYYuMV6p9V1B176Q0CvxMjKfjYJCxhGibNMptN/LvT8qM3Uvu+iHxw3p/oE+gQRXNRZlXMZzrdJFzKUOhHLPNfg1VRqqCNZ3XaGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=J07PUjIQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="J07PUjIQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490be03d47bso6799195e9.0
        for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 01:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781254598; x=1781859398; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njU7SwokzXLnAOAvKiJOLoJhBijRof4SaZzq2UEzjN0=;
        b=J07PUjIQcfKM6tHavAGYO67VO9ONUycPuAIGvH1SVAEDF1ZLBkRzUTxGMkT9GqXHF/
         nYe0tQXVPeA3ipqDeH1UgsByDoUWaTZSriZgApHxxqmi4zvl0w1gruR/gsy3dxwCzt0C
         fR7ecECBIFSvfMM+TKznoFASuHlKrHTbElqn9WzxZSDMpdAdbuXy2CJSY3WmoR9mdH/w
         IFSLWClk3ioVGdMgNDJdJBOEaQh4KNsY/Dz6Cw3IVW/zMCpyKb6obu1qvapsHFmgYexy
         GtvCk8YF1OmTrWBbDgPm8W9LEZQ4Ep6tPicK53pzE8bHj91b/8NXLe2ZpNfTqux4v4KO
         riqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781254598; x=1781859398;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=njU7SwokzXLnAOAvKiJOLoJhBijRof4SaZzq2UEzjN0=;
        b=MChVcF0dqiCFKrXxEdjSZEiaPpjrq6g1mXzRLuIOd80ABLblAndrRjm4NFhJB0FN6Y
         jgTBhYsKGU3BZpLh9TBDpm/siQN10kinX7fLMpxFAOhBZjQZUo+CD0TNKCWFHLf9fYqz
         w19rgU8VuXqqmAcMm/BmUcn5ycXbEUP22HR6V6L58T8KHsDSEKFAOsXMDwapfJ88MW7Z
         Lg6HDDTkhiphBXouH5wHmk7pHSyf8cAQzvgdS1zV7IWpxxYlS9han25eOq4b6tFd6XV8
         QoamJBJz21/UpM2vgWi7z0tRYPVE6DRfZkbDkZ8wR1+Lj0k34RFyyG/NSa2s9OGfaqzt
         a9kA==
X-Forwarded-Encrypted: i=1; AFNElJ8X5yZOVFdk/HPW3y/OOPsqjaukT0IalFWU1ysZX4AXprV3UOmDhWlpUsfb9sCtLem5DrR23cT1yZCCYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhdXrypYY7jbnVIW50VDH8WWDtDvXv2ia2xUEktfvmuFEKAESy
	Iu39VheaptpGCiPN03JxADoP1iXx1EHXYCW7C2OmwY0u2GUghirtkwK4a765rkfx2Ms=
X-Gm-Gg: Acq92OG9563miLeyXJrp5sNCUt/yiZdtqeM2izcHkw4fCDMZ0MKY+IHSYFbIETKkNji
	eXHhBCh9goKY7ZVyJZK12K9r914fWq0o5S43hyxL+SuR8NsNqUqaQ3TQpIVqbMMgWbMwQ9C7/RA
	gLhM+reuqHWc/Zfwh0vYHOSELVhHL9+5R9j3PEd0gVFjZazcsCdnI5KCjCDyzPR25M/piK0YpbM
	38UqaQFo6U/Ll4OgHtJctdKpOsb8dmtsqnhRWE7vTc9oZ0cZZM4+zaiEbqEc9IC9BqSiIEmMrPl
	fQp70qv36tphbxSLa9jzFdYo8sLK+VR4snS2pcf8bYK42d1rwc+0SsWfJOKTWxK5HktHOQ3n/+r
	v0DXHkDK37ZJZCjfREDyBEdMK6aNcMMK7q0Y3xJIeMfkMSBOG6ZtGNcZ8UNiSlo3l3DTuqy8hYE
	DVQYuJXA11oKrmwg==
X-Received: by 2002:a05:600d:8653:20b0:490:c032:ae92 with SMTP id 5b1f17b1804b1-490ec50ffc3mr15206145e9.33.1781254598006;
        Fri, 12 Jun 2026 01:56:38 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48c3dcsm2583094eec.1.2026.06.12.01.56.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:56:37 -0700 (PDT)
Date: Fri, 12 Jun 2026 16:56:31 +0800
From: joeyli <jlee@suse.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Chun-Yi Lee <joeyli.kernel@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Matthew Garrett <matthewgarrett@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, jlee@suse.com
Subject: Re: [PATCH] debugfs: Fix lockdown check for mmap_prepare
Message-ID: <20260612085631.GJ11413@linux-l9pv.suse>
References: <20260612055455.16894-1-jlee@suse.com>
 <aiusZLu4x-9UCrDH@lucifer>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiusZLu4x-9UCrDH@lucifer>
User-Agent: Mutt/1.11.4 (2019-03-13)

Hi Lorenzo, 

Thanks for your review!

On Fri, Jun 12, 2026 at 08:28:29AM +0100, Lorenzo Stoakes wrote:
> -cc wrong email
> 
> (Please make sure to use my correct email address - ljs@kernel.org -
>  I usually do not see emails sent to the incorrect one)
> 
> +From: Chun-Yi Lee <jlee@suse.com>
> 
> (You're sending from a different email address so you need to explicitly
> add a From: xxx tag to match the S-o-b at the top of the message)
>

I will use your kernel.org email address and put From: tag.
 
> 
> On Fri, Jun 12, 2026 at 01:54:55PM +0800, Chun-Yi Lee wrote:
> > Commit 651fdda8406d ("relay: update relay to use mmap_prepare")
> > changed the `mmap` file operation to `mmap_prepare` for relayfs, but
> > the lockdown check in debugfs was not updated accordingly.
> >
> > This prevents debugfs from being locked down when the kernel is in
> > integrity mode if a file uses `mmap_prepare` but not `mmap`.
> >
> > Update the lockdown check to look for `mmap_prepare` instead of `mmap`
> > to fix this.
> >
> > Fixes: 651fdda8406d ("relay: update relay to use mmap_prepare")
> 
> You need to explicitly add:
> 
> Cc: stable@vger.kernel.org
> 
> As we will want this backported.
>

I will add cc. to stable mailing list.
 
> > Signed-off-by: Chun-Yi Lee <jlee@suse.com>
> 
> I think the idea is correct, but needs tweaking to cover _both_ mmap and
> mmap_prepare, until the mmap_prepare conversion is complete, see below.
> 
> > Cc: David Howells <dhowells@redhat.com>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> > cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Rafael J. Wysocki <rafael@kernel.org>
> > Cc: Matthew Garrett <matthewgarrett@google.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: driver-core@lists.linux.dev
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  fs/debugfs/file.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
> > index edd6aafbfbaa..d5e187895dd8 100644
> > --- a/fs/debugfs/file.c
> > +++ b/fs/debugfs/file.c
> > @@ -273,7 +273,7 @@ static int debugfs_locked_down(struct inode *inode,
> >  	    (!real_fops ||
> >  	     (!real_fops->unlocked_ioctl &&
> >  	      !real_fops->compat_ioctl &&
> > -	      !real_fops->mmap)))
> > +	      !real_fops->mmap_prepare)))
> 
> This is not only applicable to relayfs.
> 
> So while we both have mmap and mmap_prepare, this should be:
> 
> -	      !real_fops->mmap)))
> +	      !real_fops->mmap &&
> +	      !real_fops->mmap_prepare)))
>

Yes, thanks a lot! I will send v2 patch.

Joey Lee 
