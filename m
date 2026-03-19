Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A7B3E1D07;
	Thu, 19 Mar 2026 15:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773934209; cv=none; b=tzHzd3/ar7pZPCIeNSEVql1D5kAHHMv4BrMDdO/G3dplZi90uC7841gpIsMly9DrrtyUpjdKg7zIOLzvzuQKlF8IDXxx4y3GhSyBF1W+SSD05B3GAtsKgVLr/1cpNzqmH1TwRiK8y5BcivcacidPepnLhWPHPCpPB4prxmgYKfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773934209; c=relaxed/simple;
	bh=yHJXUYqS+4G3Ifz6Zr3lL3RYGSo6GuNq2lZOmgD2wOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=puaNar9R+qsKcKaMeZ604bLJHVstSD/Zh6w0/A3i7aHuxQswN9Ckn697g/Rs3eJrBdz/gH/6AZA2EXPs9u+vww9xymuZ8lvCJDHoYKP8NnGxsIZH6W2ww4GRGgMJnKsPx3mcrUuTb19Vk2FESJXTUSbBlmtSF2XJZ5IfyPXIGug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GpFlR/tl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GpFlR/tl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D14AC19424;
	Thu, 19 Mar 2026 15:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773934209;
	bh=yHJXUYqS+4G3Ifz6Zr3lL3RYGSo6GuNq2lZOmgD2wOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GpFlR/tlZg8PBskWfta88H3op/yV+o5BFib72+/CpKATKF//E+j6UuN5rYrwNp9Zw
	 +Fwtn6VbVXHBketl3NKC1D/odYJygpRT1+f+4NEpCRQGZyctli53Tv0g3PxBuYIi4j
	 64OFfJ/SQ4MLfOG41lV0uPVtTFiT+wfIOhuplLLw=
Date: Thu, 19 Mar 2026 16:30:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michal Grzedzicki <mge@meta.com>
Cc: Jeff Layton <jlayton@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] firmware_loader: allow firmware_class.path to take
 multiple paths
Message-ID: <2026031940-alive-fled-155b@gregkh>
References: <20260318-fw-path-v3-1-a701a08bc025@kernel.org>
 <2026031940-baritone-handsaw-f1d3@gregkh>
 <28b06032286beed696b0e95f9e96247cfd3ff667.camel@kernel.org>
 <2026031906-unspoiled-bunny-2279@gregkh>
 <efbcc06d09d6232b8dcd6793b5f12dcb85e9f1ee.camel@kernel.org>
 <A24983CC-F76E-43A4-8428-D4F323B2486E@meta.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A24983CC-F76E-43A4-8428-D4F323B2486E@meta.com>

On Thu, Mar 19, 2026 at 02:13:09PM +0000, Michal Grzedzicki wrote:
> 
> > On 19 Mar 2026, at 11:47, Jeff Layton <jlayton@kernel.org> wrote:
> > 
> > On Thu, 2026-03-19 at 12:39 +0100, Greg Kroah-Hartman wrote:
> >> On Thu, Mar 19, 2026 at 07:34:46AM -0400, Jeff Layton wrote:
> >>> On Thu, 2026-03-19 at 07:23 +0100, Greg Kroah-Hartman wrote:
> >>>> On Wed, Mar 18, 2026 at 03:54:02PM -0400, Jeff Layton wrote:
> >>>>> Refactor fw_get_filesystem_firmware() by extracting the per-path
> >>>>> firmware loading logic into a new fw_try_firmware_path() helper.
> >>>>> 
> >>>>> Use this helper to parse fw_path_para for ':'-separated paths,
> >>>>> trying each one before falling through to the default firmware
> >>>>> search paths. This allows users to specify multiple custom firmware
> >>>>> directories via firmware_class.path, e.g.:
> >>>>> 
> >>>>>  firmware_class.path=/custom/path1:/custom/path2
> >>>>> 
> >>>>> A backslash can be used as an escape character, allowing a literal
> >>>>> ':' ("\:") or literal '\' ("\\") to be embedded in a pathname.
> >>>> 
> >>>> This is a mess, what could go wrong embedding another parser in the
> >>>> kernel :)
> >>>> 
> >>>> Let's step back, why is this needed at all?  The kernel already supports
> >>>> multiple standard locations for firmware paths, and one custom location.
> >>>> Why do we now need more than that?  What changed to require this and who
> >>>> is going to use it (and support it, and actually test it?)
> >>>> 
> >>> 
> >>> We have at least one internal user that requested the ability to do
> >>> this. I'll see if they can articulate their use-case better.
> >> 
> >> Please do.
> >> 
> > 
> > Michal said he'll outline his use-case.
> 
> 
> Internally, we distribute firmware binaries as read-only snapshots, and a system may have more than one. Without this feature, we must maintain a symlink farm to merge multiple snapshots into a single path. We would love to remove this workaround and switch to just passing multiple paths.
> 
> Also a common pattern I seen in vendor shell scripts is temporarily setting firmware_class.path to the current working directory, loading the module, and then restoring firmware_class.path to its previous value, with this feature it could be made safer.

How would putting a bunch of different filepaths be "safer"?  A shell
script will have to read the value, append their path to it, and then
write it back?  And how will that ever work given that they will not
know if this is a kernel version that can support multiple paths in a
single value?

I think if you are going to change the way the option works, it needs to
be renamed so that everyone "knows" they can rely on it, otherwise no
one will use it.

thanks,

greg k-h
