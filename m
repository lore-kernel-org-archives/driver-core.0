Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E103806DC
	for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773822747; cv=none; b=aQdEcU+Zew58D0yELPkA2KK9fMSsD4AfV/R7LETUW4YtjIfA43Q8RCl9J9AzkKhL5IoPUGd9Vq49NB//X1pXLF3tOWT5SOsYAJk/lTKGYERGNRf6HD7ATJZdA/MPTJr/+iDCIEav9VHUQu+GZOohVdNrOX/BJMWSR4h+JUWW/TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773822747; c=relaxed/simple;
	bh=J2qiH7yqvvTWnbSHiNC614ud0jSRe4pK95575XBxqAg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rSLKu+rPaoRgWdvBrVgoCH38lBNuspZTD8z2WchPj/GeJT3kXyvr9BWrdSZJ1aUSw4AqY0mtrSdm+cTqmg5eFdpow4Rf/IIFiCTgHsTg+0Mh/MY1AVkXnijrU7JuwDBA+L+PJ5NFZFWIPrh3ICd/n1u3oENOJYeLklmUt9FHAuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBXdsW8B; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBXdsW8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773822746; x=1805358746;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=J2qiH7yqvvTWnbSHiNC614ud0jSRe4pK95575XBxqAg=;
  b=EBXdsW8Bv8GlT4E6+BZjnYGbYSgXkruPnbui/LWuHZCGJzF+7JtWPBJA
   dzwi8zw9m/Nxf0S+tgevEBF+kZIkoMv0xulgpAc4+Olf0cPRz30vPVPLe
   bspobHy8s/w3WlsQ2Du4b6xtCz18VMeVxrAj4YMK1VsIw50Q12vX17aKU
   L6BY1pX27TSPOEch35HdDciRFZ3VmDAWJoTiF/9aTGhv9wB1k0Sa1HBlN
   Xov3BI2+n/DWTDUBMWS6uL+Sw0kx7zTDqKqbKcSo29TzaVqihFJ8mrsXu
   k4kvis5U/gs49LJ9B6RQNYeYxdZgXd5yg9j3H+69TV+CrDhpbWGK+w8Yz
   Q==;
X-CSE-ConnectionGUID: c2rRX16RTB2K1ZZKqzV8Sw==
X-CSE-MsgGUID: J3tO29r2QVGGzlr1Qhup6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74570290"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74570290"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 01:32:26 -0700
X-CSE-ConnectionGUID: ZZxHlhQjTdWLSegJQytkkw==
X-CSE-MsgGUID: 99UwL+v5TK2LtwdQRh3htw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="218604251"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.79])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 01:32:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: gregkh@linuxfoundation.org, dakr@kernel.org, rafael@kernel.org,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch,
 gustavo.sousa@intel.com, demarchi@kernel.org, jouni.hogander@intel.com,
 luciano.coelho@intel.com, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org, akaieurus@gmail.com, me@ziyao.cc
Subject: Re: [PATCH 4/4] drm/i915/display: initialize string params to empty
 strings
In-Reply-To: <CALbr=LadoX8g--rtU==HQfNQ9f1=KP=7AS-PGfooKaSbnYPz+Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260317185920.43387-1-hanguidong02@gmail.com>
 <20260317191538.43535-1-hanguidong02@gmail.com>
 <c14b399c9c6bf96f8c7d33615561b0d787ff175b@intel.com>
 <CALbr=LadoX8g--rtU==HQfNQ9f1=KP=7AS-PGfooKaSbnYPz+Q@mail.gmail.com>
Date: Wed, 18 Mar 2026 10:32:14 +0200
Message-ID: <8ac4b6ef2dfbc1dce0047dee55f2df609287a3ec@intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Mar 2026, Gui-Dong Han <hanguidong02@gmail.com> wrote:
> On Wed, Mar 18, 2026 at 4:12=E2=80=AFAM Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:
>>
>> On Wed, 18 Mar 2026, Gui-Dong Han <hanguidong02@gmail.com> wrote:
>> > Passing NULL to debugfs_create_str() causes a NULL pointer dereference
>> > upon reading, and is no longer permitted. Change the default values of
>> > dmc_firmware_path and vbt_firmware to empty strings ("").
>> >
>> > Existing code that consumes these parameters already verifies both
>> > pointer validity and string length, so empty strings are handled
>> > correctly. Furthermore, heap allocation is not required here: these
>> > debugfs parameters are created with strictly read-only permissions
>> > (0400). As a result, the debugfs write operation is never invoked,
>> > meaning the static empty string will not be erroneously freed by
>> > kfree().
>> >
>> > Fixes: e9913f0bd2e1 ("drm/i915/display: move dmc_firmware_path to disp=
lay params")
>> > Fixes: 29292bc6cc37 ("drm/i915/display: Move vbt_firmware module param=
eter under display")
>> > Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_display_params.h | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/dri=
vers/gpu/drm/i915/display/intel_display_params.h
>> > index b95ecf728daa..0a8cad98d480 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_display_params.h
>> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
>> > @@ -23,8 +23,8 @@ struct drm_printer;
>> >   *       debugfs file
>> >   */
>> >  #define INTEL_DISPLAY_PARAMS_FOR_EACH(param) \
>> > -     param(char *, dmc_firmware_path, NULL, 0400) \
>> > -     param(char *, vbt_firmware, NULL, 0400) \
>> > +     param(char *, dmc_firmware_path, "", 0400) \
>> > +     param(char *, vbt_firmware, "", 0400) \
>>
>> Admittedly this is all very convoluted, but these NULL pointers (or
>> pointers to them) are never passed to debugfs_create_str().
>
> Hi Jani,
>
> Thanks for your review.
>
> Could you elaborate on why they are never passed? Looking at
> intel_display_debugfs_params.c, the intel_display_debugfs_params()
> function iterates over INTEL_DISPLAY_PARAMS_FOR_EACH using the
> REGISTER macro. This eventually calls
> _intel_display_param_create_file(), which uses _Generic to dispatch
> char ** types to debugfs_create_str().

In _intel_display_param_create_file(), valp is &display->params.x, where
x is dmc_firmware_path or vbt_firmware.

display->params gets initialized using intel_display_params_copy() when
struct intel_display is allocated in intel_display_device_probe(). In
intel_display_params_copy(), _param_dup_charp() handles the NULL
initializer.

Granted, if the kstrdup() fails, you could end up having NULL there, but
at that point it's fine if your debugfs_create_str() change barfs and
bails out.

Like I said, it's convoluted. ;)

BR,
Jani.



--=20
Jani Nikula, Intel
